(*
 * Copyright (C) Citrix Systems Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; version 2.1 only. with the special
 * exception on linking described in file LICENSE.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *)

let bytes_of_handle h =
	let s = String.make 16 '\000' in
	for i = 0 to 15 do
		s.[i] <- char_of_int h.(i)
	done;
	s

let uuid_of_handle h =
	let h' = bytes_of_handle h in
	match Uuidm.of_bytes h' with
	| Some x -> x
	| None -> failwith (Printf.sprintf "VM handle '%s' is in invalid uuid" h')

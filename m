Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CDDC04A6A
	for <ath12k@archiver.kernel.org>; Thu, 10 Aug 2023 13:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LCjPyfUWi7jSV19J6+uK6zrWEW5c6IF/uUsOm3gJH7Q=; b=Hy+5WVCKBMi5Nx
	p0vYOC8zjOhOP882NSZnmzeNiOeeBGA+x07PqifvbMzc1Z8LIETwrLXfyPV9c9TzgHo9lO9GEGbQ1
	CecEqh1ypJKgYAKtxlTncNVLozOCGcNX8sbr9zNDiLkLmj4ELS+zd7ltU6pQ4MTTeyNc9aogpnHw9
	R2zfUbEmmAtEGRGQnj4BIDUEVVtk2IHZ49SGw7zm2a0E758y4R8UOJF+pTKUanszexbaPhBP5P0h/
	mjoc0B2aD6CdKU2mytnWE7Hp7QntVqWE2cYFeNldUGxuK31wldfNYyZXA7NIdDINXcDF75FHXLaIj
	dIkMM7Cvh8/bFLkf7/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU600-007mp7-2I
	for ath12k@archiver.kernel.org;
	Thu, 10 Aug 2023 13:46:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU5zy-007moU-2o
	for ath12k@bombadil.infradead.org;
	Thu, 10 Aug 2023 13:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iOAvJZH5JY+Z/57aBU4Dk2Q0ieWD9M1c8GTw6TAKfro=; b=SNjEoTQ4z3vMdUzBF1pBGKdiWP
	yo3sXHgG1foKj1tImPGzv8AJP+YmZnr7WlazNf/KX+G3HjjlvFBS8PRUIv+oGFI3WvfpMiM1UTGbm
	FpEz9tmhf5YusTECvP/ZYH7zQQIrIpAgUIWQ4NBeBN142XuppwsFb549q1IJ0J54+iWo8S9yAKLTs
	F6MeSnahxX6G/jEiUQG3DFs4NmRxkmDYu97kH8Q0rAIKt4JoukybT+iNLgW+JJMTt+8JtVfylf9xV
	lpX0y6AHYpdR5Lu+v3rgOXn0WTF3Jw7YhCuVRoZk8CgAZl67t+NtywwAUuuxcCg86Y/huAiBCreQg
	8GsMHbfw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU5zu-006WQ6-33
	for ath12k@lists.infradead.org;
	Thu, 10 Aug 2023 13:46:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37AAJECY024365;
	Thu, 10 Aug 2023 13:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iOAvJZH5JY+Z/57aBU4Dk2Q0ieWD9M1c8GTw6TAKfro=;
 b=nCpYsSvDfBcm+d7vG18cAWOlTM7tv+WAirOPAhGlBAdFWspkKePv+GNXfQ7bd5orjqXg
 +okvBQwzbituoPTgrqaegGlBRAt0dE/pAVb7VgpGnZIdsi5GfIMlgTEYXYbSAGhmYMeQ
 2PgB7uDPN3WTKFjlASgS1nXU3rH4AHm/AyYTy5hqkRTQ5yFAv8rlv1BvPJO1tnQuu+HO
 iL5vzDr2bmy3LFY8plPf9B+ZB2iFBtATuT49Vyn8ISw+1oFrRuo9QPeiKljt6oarPKQ/
 scigFlvVOws8Ulswm+726NCPDpUIQ9jxD+wsMgeIcbVekotaQ/UlUZNpp/9hmMj/g7OA 6Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sc5ffbhm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 13:46:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37ADkRlr008604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 13:46:27 GMT
Received: from [10.111.183.64] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 10 Aug
 2023 06:46:27 -0700
Message-ID: <53b0e1af-c013-72d0-d98d-38ae44962dec@quicinc.com>
Date: Thu, 10 Aug 2023 06:46:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: Fix buffer overflow when scanning with
 extraie
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230809081241.32765-1-quic_wgong@quicinc.com>
 <4e63a318-2aa0-2993-ae03-5544c6e41390@quicinc.com>
 <3206e181-f770-c599-87e1-364114b9746a@quicinc.com>
 <db119d06-7549-3be9-524f-327485d34da9@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <db119d06-7549-3be9-524f-327485d34da9@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XuEi1uWN8RLmsPXe07kQ98qW_Y7fJdJD
X-Proofpoint-GUID: XuEi1uWN8RLmsPXe07kQ98qW_Y7fJdJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_10,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=823
 mlxscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308100117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_144643_308727_C82C5B37 
X-CRM114-Status: GOOD (  20.92  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

T24gOC85LzIwMjMgOTozMSBQTSwgV2VuIEdvbmcgd3JvdGU6Cj4gT24gOC8xMC8yMDIzIDI6MTYg
QU0sIEplZmYgSm9obnNvbiB3cm90ZToKPj4gT24gOC85LzIwMjMgMTA6MzEgQU0sIEplZmYgSm9o
bnNvbiB3cm90ZToKPj4+IE9uIDgvOS8yMDIzIDE6MTIgQU0sIFdlbiBHb25nIHdyb3RlOgo+Pj4+
Cj4gWy4uLl0KPj4+Cj4+PiBSZXZpZXdlZC1ieTogSmVmZiBKb2huc29uIDxxdWljX2pqb2huc29u
QHF1aWNpbmMuY29tPgo+Pgo+PiBXZW4sIGNhbiB5b3UgcGxlYXNlIGFkZCBhIEZpeGVzOiB0YWcg
c2luY2UgYmFzZWQgdXBvbiB0aGUgZGlzY3Vzc2lvbiAKPj4geW91IGFjdHVhbGx5IG9ic2VydmVk
IGEgY3Jhc2gKPj4KPiBKZWZmLCBkbyB5b3UgbWVhbiBJIHNob3VsZCBhZGQgdGhlIGNyYXNoIGNh
bGwgc3RhY2sgb3Igb3RoZXIgdGhpbmcgaW4gCj4gdGhpcyBwYXRjaD8KPiAKPiBUaGUgY3Jhc2gg
aXMgb2JzZXJ2ZWQgYnkgU3ZlbiBFY2tlbG1hbm4gPHN2ZW5AbmFyZmF0aW9uLm9yZz7CoCBvbiAw
NyBEZWMgCj4gMjAyMSBoZXJlOgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGF0aDExazogZW5hYmxl
IAo+IElFRUU4MDIxMV9IV19TSU5HTEVfU0NBTl9PTl9BTExfQkFORFMgZm9yIFdDTjY4NTUKPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC13aXJlbGVzcy8zMjY3ODA1LmVsOWtramxmVVpA
cmlwcGVyLwo+IAo+IAo+IAoKSXQgaXNuJ3QgbmVjZXNzYXJ5IHRvIGFkZCBhIGNhbGwgc3RhY2su
IEJhc2VkIHVwb24gdGhlIGFib3ZlIHlvdSBzaG91bGQgCmFkZCBib3RoIGEgRml4ZXM6IHRhZyBh
bmQgYSBMaW5rOiB0YWcuIFRoZXNlIGdvIGluIHRoZSB0YWdzIHNlY3Rpb24gb2YgCnRoZSBjb21t
aXQgdGV4dCBiZWZvcmUgdGhlIFNpZ25lZC1vZmYtYnk6Cgo8aHR0cHM6Ly93d3cua2VybmVsLm9y
Zy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbCN1c2luZy1y
ZXBvcnRlZC1ieS10ZXN0ZWQtYnktcmV2aWV3ZWQtYnktc3VnZ2VzdGVkLWJ5LWFuZC1maXhlcz4K
QSBGaXhlczogdGFnIGluZGljYXRlcyB0aGF0IHRoZSBwYXRjaCBmaXhlcyBhbiBpc3N1ZSBpbiBh
IHByZXZpb3VzIApjb21taXQuIEl0IGlzIHVzZWQgdG8gbWFrZSBpdCBlYXN5IHRvIGRldGVybWlu
ZSB3aGVyZSBhIGJ1ZyBvcmlnaW5hdGVkLCAKd2hpY2ggY2FuIGhlbHAgcmV2aWV3IGEgYnVnIGZp
eC4gVGhpcyB0YWcgYWxzbyBhc3Npc3RzIHRoZSBzdGFibGUga2VybmVsIAp0ZWFtIGluIGRldGVy
bWluaW5nIHdoaWNoIHN0YWJsZSBrZXJuZWwgdmVyc2lvbnMgc2hvdWxkIHJlY2VpdmUgeW91ciAK
Zml4LiBUaGlzIGlzIHRoZSBwcmVmZXJyZWQgbWV0aG9kIGZvciBpbmRpY2F0aW5nIGEgYnVnIGZp
eGVkIGJ5IHRoZSAKcGF0Y2guIFNlZSBEZXNjcmliZSB5b3VyIGNoYW5nZXMgZm9yIG1vcmUgZGV0
YWlscy4KCgo8aHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9z
dWJtaXR0aW5nLXBhdGNoZXMuaHRtbCNkZXNjcmliZS1jaGFuZ2VzPgpJZiByZWxhdGVkIGRpc2N1
c3Npb25zIG9yIGFueSBvdGhlciBiYWNrZ3JvdW5kIGluZm9ybWF0aW9uIGJlaGluZCB0aGUgCmNo
YW5nZSBjYW4gYmUgZm91bmQgb24gdGhlIHdlYiwgYWRkICdMaW5rOicgdGFncyBwb2ludGluZyB0
byBpdC4gSWYgdGhlIApwYXRjaCBpcyBhIHJlc3VsdCBvZiBzb21lIGVhcmxpZXIgbWFpbGluZyBs
aXN0IGRpc2N1c3Npb25zIG9yIHNvbWV0aGluZyAKZG9jdW1lbnRlZCBvbiB0aGUgd2ViLCBwb2lu
dCB0byBpdC4KCgotLSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK

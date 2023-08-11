Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6553C0015E
	for <ath12k@archiver.kernel.org>; Fri, 11 Aug 2023 09:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iiDGYRUb9XrqSInYcAG71e7qjmf5eh8+okiytbxHb4k=; b=sAKP5zZVsARZoX
	VQVUJ1wYamMDLzzUG14jJRcVbzDCuO/bHaVrDngLuvnZveLBtRi8FPz/u/BjYoJ0FXYuTXLhTi9eZ
	lIOcy041A3/y8QBp+FkACuwpBwBFFT7ZYIypswB4mRFjij7WOFAiUw2o9zsRJ2SBbcf/gw1UQqy9a
	1xRpwhFtB4R77bPvMfNzOMEJdaCIc9JvMSJSRv5GnN71O79mARTlNrJ7daGkAPrzrpNWa1Sfa9i2L
	KVr4KT1ovLUZ0y+FufbAJCJv7hKlPxs+cejJxV8nB5F57nfV8/oOBHgtD13VIC464MBjwDpRjISsm
	jsI6dUGVbJXpEeFm6ObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOHG-009waC-1M
	for ath12k@archiver.kernel.org;
	Fri, 11 Aug 2023 09:17:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOHD-009wZm-0Y
	for ath12k@lists.infradead.org;
	Fri, 11 Aug 2023 09:17:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37B5SDOo021061;
	Fri, 11 Aug 2023 09:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1d4cKS2h2HQFExZcyQWO78uzg8vVcrt2xkt1HqZchc0=;
 b=k24GEjbYP0uL8UK4EHKP14hAJSXN5i0wiz20MRcisIdrSArPe8WXXhDR8BVsCQ2tHRkL
 bqx5EBGSl2g6Too3SqMYz836KDna64354wHnezxd8aLx12xbDZFzyY1MtZpQZulSmTN7
 L9CmYmKkPhdGFQjWeqgtjTPNbxUqpa2p+BKunHiZ3USoHNeGSk80tpsTPn94WhkiOJ4R
 GtzbAGrJiehH4qXvzF7kWuq6wDLuB9P2qcTVaMf9t0LxVPn6u14xH9iwntWeFnNw55Bu
 i8NgkEzEAyv7adNZahkjs7/9G+0HmcfmIxcV+nAZOcHnC2MY0pFcV4kw6TO4fwJTRbQR Mw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sd8ywh74g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 09:17:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37B9HjN4014702
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 09:17:45 GMT
Received: from [10.201.206.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 11 Aug
 2023 02:17:43 -0700
Message-ID: <32e5e589-cb13-b27b-21e2-a9cffd160b3a@quicinc.com>
Date: Fri, 11 Aug 2023 14:47:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH 1/2] wifi: ath12k: Ignore fragments from uninitialized
 peer in dp
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230809042738.13394-1-quic_hprem@quicinc.com>
 <20230809042738.13394-2-quic_hprem@quicinc.com>
 <00af8b1a-40d4-469c-8646-d542db77b937@quicinc.com>
From: Harshitha Prem <quic_hprem@quicinc.com>
In-Reply-To: <00af8b1a-40d4-469c-8646-d542db77b937@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dx9JytAPUNxwyUYMySoTVZ2wkVktVPW0
X-Proofpoint-GUID: dx9JytAPUNxwyUYMySoTVZ2wkVktVPW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_20,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=935 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308110084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_021747_328075_879884E0 
X-CRM114-Status: GOOD (  14.34  )
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

CgpPbiA4LzkvMjAyMyAxMTo0MSBQTSwgSmVmZiBKb2huc29uIHdyb3RlOgo+IE9uIDgvOC8yMDIz
IDk6MjcgUE0sIEhhcnNoaXRoYSBQcmVtIHdyb3RlOgo+PiBXaGVuIG1heCB2aXJ0dWFsIGFwIGlu
dGVyZmFjZXMgYXJlIGNvbmZpZ3VyZWQgaW4gYWxsIHRoZSBiYW5kcwo+PiB3aXRoIEFDUyBhbmQg
aG9zdGFwZCByZXN0YXJ0IGlzIGRvbmUgZXZlcnkgNjBzLAo+PiBhIGNyYXNoIGlzIG9ic2VydmVk
IGF0IHJhbmRvbSB0aW1lcy4KPiAKPiBuaXQ6IHBsZWFzZSBmaWxsIHRoZSBwYXJhZ3JhcGggdG8g
NzArIGNvbHVtbnMKPiAKPj4KPj4gSW4gdGhlIGFib3ZlIHNjZW5hcmlvLCBhIGZyYWdtZW50ZWQg
cGFja2V0IGlzIHJlY2VpdmVkIGZvciBzZWxmIHBlZXIsCj4+IGZvciB3aGljaCByeF90aWQgYW5k
IHJ4X2ZyYWdzIGFyZSBub3QgaW5pdGlhbGl6ZWQgaW4gZGF0YXBhdGguCj4+IFdoaWxlIGhhbmRs
aW5nIHRoaXMgZnJhZ21lbnQsIGNyYXNoIGlzIG9ic2VydmVkIGFzIHRoZSByeF9mcmFnIGxpc3QK
Pj4gaXMgdW5pbml0aWFsaXNlZCBhbmQgd2hlbiB3ZSB3YWxrIGluIGF0aDEya19kcF9yeF9oX3Nv
cnRfZnJhZ3MsCj4gCj4gbml0OiBzL3VuaW5pdGlhbGlzZWQgL3VuaW5pdGlhbGl6ZWQvCj4gCj4+
IHNrYiBudWxsIGxlYWRzIHRvIGV4Y2VwdGlvbi4KPj4KPj4gVG8gYWRkcmVzcyB0aGlzLCBiZWZv
cmUgcHJvY2Vzc2luZyByZWNlaXZlZCBmcmFnbWVudHMgd2UgY2hlY2sKPj4gZHBfc2V0dXBfZG9u
ZSBmbGFnIGlzIHNldCB0byBlbnN1cmUgdGhhdCBwZWVyIGhhcyBjb21wbGV0ZWQgaXRzCj4+IGRw
IHBlZXIgc2V0dXAgZm9yIGZyYWdtZW50IHF1ZXVlLCBlbHNlIGlnbm9yZSBwcm9jZXNzaW5nIHRo
ZQo+PiBmcmFnbWVudHMuCj4+Cj4+IENhbGwgdHJhY2U6Cj4+IMKgwqDCoMKgIFBDIHBvaW50cyB0
byAiYXRoMTJrX2RwX3Byb2Nlc3NfcnhfZXJyKzB4NGU4LzB4ZmNjIFthdGgxMmtdIgo+PiDCoMKg
wqDCoCBMUiBwb2ludHMgdG8gImF0aDEya19kcF9wcm9jZXNzX3J4X2VycisweDQ4MC8weGZjYyBb
YXRoMTJrXSIuCj4+IMKgwqDCoMKgIFRoZSBCYWNrdHJhY2Ugb2J0YWluZWQgaXMgYXMgZm9sbG93
czoKPj4gwqDCoMKgwqAgYXRoMTJrX2RwX3Byb2Nlc3NfcnhfZXJyKzB4NGU4LzB4ZmNjIFthdGgx
MmtdCj4+IMKgwqDCoMKgIGF0aDEya19kcF9zZXJ2aWNlX3NybmcrMHg3OC8weDI2MCBbYXRoMTJr
XQo+PiDCoMKgwqDCoCBhdGgxMmtfcGNpX3dyaXRlMzIrMHg5OTAvMHhiMGMgW2F0aDEya10KPj4g
wqDCoMKgwqAgX19uYXBpX3BvbGwrMHgzMC8weGE0Cj4+IMKgwqDCoMKgIG5ldF9yeF9hY3Rpb24r
MHgxMTgvMHgyNzAKPj4gwqDCoMKgwqAgX19kb19zb2Z0aXJxKzB4MTBjLzB4MjQ0Cj4+IMKgwqDC
oMKgIGlycV9leGl0KzB4NjQvMHhiNAo+PiDCoMKgwqDCoCBfX2hhbmRsZV9kb21haW5faXJxKzB4
ODgvMHhhYwo+PiDCoMKgwqDCoCBnaWNfaGFuZGxlX2lycSsweDc0LzB4YmMKPj4gwqDCoMKgwqAg
ZWwxX2lycSsweGYwLzB4MWMwCj4+IMKgwqDCoMKgIGFyY2hfY3B1X2lkbGUrMHgxMC8weDE4Cj4+
IMKgwqDCoMKgIGRvX2lkbGUrMHgxMDQvMHgyNDgKPj4gwqDCoMKgwqAgY3B1X3N0YXJ0dXBfZW50
cnkrMHgyMC8weDY0Cj4+IMKgwqDCoMKgIHJlc3RfaW5pdCsweGQwLzB4ZGMKPj4gwqDCoMKgwqAg
YXJjaF9jYWxsX3Jlc3RfaW5pdCsweGMvMHgxNAo+Pgo+PiBUZXN0ZWQtb246IFFDTjkyNzQgaHcy
LjAgUENJIFdMQU4uV0JFLjEuMC4xLTAwMDI5LVFDQUhLU1dQTF9TSUxJQ09OWi0xCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEhhcnNoaXRoYSBQcmVtIDxxdWljX2hwcmVtQHF1aWNpbmMuY29tPgo+PiAt
LS0KPiAKPiBhY3R1YWwgY29kZSBwYXRjaCBMR1RNCj4gClRoYW5rIHlvdSBKZWZmLiBTdXJlLCB3
aWxsIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UuCgpUaGFua3MsCkhhcnNoaXRoYQoKLS0gCmF0
aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cHM6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==

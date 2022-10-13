Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1FFC433FE
	for <ath12k@archiver.kernel.org>; Thu, 13 Oct 2022 20:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKK76QhS1Z/imG1+3blcZKLEn8gIJR0uFXULHf0LBGU=; b=V9GlWtpUNKP9VI
	ZSfQCEpclipYwNilXKhCFNLRYAyIxv8AHydeurNyAcnnSaY9NM4Q6Drw3XmKggv84VlXcXc7n0Kpo
	kvPR2JBi8Hdpo/Nlp7HFZuKFa0o8+VLSKBdFInsXFb5t8NgBy2nY2dsgm+5U/yOST9QZ/Qlad250S
	we3jI724cxjmDYdqXmTPZw5omQm/dczQU330LT/5rWKwB65v1zlv1TmPaVBpChihREq9s/4rOHWqw
	1JeXvFseRs58jx5XAOv/+fCpB6xLwUOZRhSdTVhjJDORQmH1/vL3yGQPUL4jovC7KLqXTZnGTTggy
	dNkaHCeje57od+UmrotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4dy-00CuQg-Bp
	for ath12k@archiver.kernel.org; Thu, 13 Oct 2022 20:17:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4dv-00CuQF-VY
	for ath12k@lists.infradead.org; Thu, 13 Oct 2022 20:17:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DJdDoN031353;
	Thu, 13 Oct 2022 20:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3kgg5bSTIzW7cbB9iUyBrzYk0w1V6YuhaD8JYRcqW38=;
 b=FqrATT8ITl4O7cjhdSVAzg0BEZTgghzScUiumMht89gEtBAGJwYJKLonwGrDbyW53xE/
 dTALs4CrCZlo2XwbAJr0emlatYHvyv/xNDglPSb+aj2xd6mQX+pgXSFbrjT0RdKMfrYV
 CVVAnmu4OIt3J3ShfAtGuvME7WGbETGW5aiPbZTbTawMqe9EYzOVIiMrEXEWuwyzLDUa
 k9K7GZO2CxsFKR/rBRAT4El3fOo8PwA8nzNjqvZ5+BzAARDvRHjy2pCnOa1ogdZ84DJX
 e6/SSCR7amPWLCisFC6f+C0BCJyqZDTYMFfpDu24/P4QXSlPX/UOsaTVoZDTHBVNSVMS Xw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k6br7tcc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 20:17:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29DKHHwd026315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 20:17:17 GMT
Received: from [10.110.65.190] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 13 Oct
 2022 13:17:16 -0700
Message-ID: <8c3127db-85f8-c5ce-7939-7151060887e2@quicinc.com>
Date: Thu, 13 Oct 2022 13:17:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 11/50] wifi: ath12k: add dp.c
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-12-kvalo@kernel.org>
 <65a4750f-1798-a624-0a2e-96930f8ec816@quicinc.com>
 <CH0PR02MB82123C176B0E05156B66C9F1F6229@CH0PR02MB8212.namprd02.prod.outlook.com>
 <94e894a8-a262-959e-a6ab-869dcba9e0fa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <94e894a8-a262-959e-a6ab-869dcba9e0fa@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cNgs7FlYvpKMO6ORE7gnxooGHx3fTXIl
X-Proofpoint-ORIG-GUID: cNgs7FlYvpKMO6ORE7gnxooGHx3fTXIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_08,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=921 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_131724_209549_6DE16EBC 
X-CRM114-Status: GOOD (  17.40  )
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

T24gMTAvMTMvMjAyMiA5OjMwIEFNLCBQcmFkZWVwIEt1bWFyIENoaXRyYXB1IHdyb3RlOgo+IAo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB3b3JrX2RvbmUgPQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhdGgx
MmtfZHBfbW9uX3Byb2Nlc3NfcmluZyhhYiwKPj4+ICsgaWQsIG5hcGksIGJ1ZGdldCwKPj4gZGVz
Y2VuZGFudCBpcyBub3QgaW5kZW50ZWQgZnJvbSB0aGUgZmlyc3QgbGluZSwgbWFraW5nIGl0IGRp
ZmZpY3VsdCB0byAKPj4gc2VlIHRoZSBjb2RlIHN0cnVjdHVyZQo+Pgo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBmbGFnKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnVkZ2V0IC09IHdvcmtfZG9uZTsKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdG90X3dvcmtfZG9uZSArPSB3b3JrX2RvbmU7Cj4+PiArCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChidWRnZXQgPD0gMCkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGdvdG8gZG9uZTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+ICvC
oMKgwqDCoCB9Cj4+PiArCj4+PiArwqDCoMKgwqAgaWYgKGFiLT5od19wYXJhbXMtPnJpbmdfbWFz
ay0+dHhfbW9uX2Rlc3RbZ3JwX2lkXSkgewo+PiB0aGlzIGJsb2NrIG9mIGNvZGUgaGFzIHRoZSBz
YW1lIGlzc3VlcyBhcyB0aGUgUlggYmxvY2suIGluIGZhY3QgaXQgCj4+IHNlZW1zIHRoYXQgdGhp
cyBibG9jayBpcyBpZGVudGljYWwgdG8gdGhlIGJsb2NrIGFib3ZlIG90aGVyIHRoYW4gdGhlIAo+
PiBmbGFnIGFuZCB0aGUgdHhfbW9uX2Rlc2MgdnMgcnhfbW9uX2Rlc2MsIHNvIEknbSBjdXJpb3Vz
IGlmIGl0IGNvdWxkIGJlIAo+PiByZWZhY3RvcmVkIGludG8gYSBzaW5nbGUgZnVuY3Rpb24gdGhh
dCBjb3VsZCBiZSB1c2VkIGJ5IGJvdGggdHggYW5kIHJ4IAo+PiBpbnN0ZWFkIG9mIGR1cGxpY2F0
aW5nIGNvZGUKPiAKPiBIaSBKZWZmCj4gCj4gVGhhbmtzIGZvciB5b3VyIHJldmlldy4uCj4gCj4g
QWx0aG91Z2gsIHJ4IGFuZCB0eCBtb24gcmluZ3MgcHJvY2Vzc2luZyBibG9ja3MgY2FuIGJlIG1v
dmVkIHRvIGNvbW1vbiAKPiBmdW5jdGlvbiwgdGhpcyBjYXVzZXMgbG90IG9mIHZhcmlhYmxlcyB0
byBiZSBzZW50IHRvIGZ1bmN0aW9uIHVzaW5nIHBhc3MgCj4gYnkgcmVmZXJlbmNlLCBoZW5jZSBh
dm9pZGluZyB0aGlzIGdlcnJpdCBmb3IgdHJhZGVvZmYuIFBsZWFzZSBsZXQgbWUgCj4ga25vdyBp
ZiB0aGlzIGlzIG9rPwoKeWVzLCB0aGF0IGlzIG9rLiBpdCBpcyBhbHdheXMgYSB0cmFkZW9mZiBh
bmQgZGlmZmVyZW50IGZvbGtzIHdpbGwgd2VpZ2ggCnRoZSB0cmFkZW9mZnMgZGlmZmVyZW50bHks
IGFuZCBub2JvZHkgaXMgInJpZ2h0Ii4gQXMgbG9nIGFzIHRoZSBjb2RlIAp3b3JrcyA6KQoKCi0t
IAphdGgxMmsgbWFpbGluZyBsaXN0CmF0aDEya0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHBzOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEyawo=

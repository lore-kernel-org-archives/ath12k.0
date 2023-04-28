Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDEFC77B61
	for <ath12k@archiver.kernel.org>; Fri, 28 Apr 2023 21:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MamB45SLrGBS/OxiNQQLQXao5/ub5fvrBnzyzddLR9w=; b=J1uJIpUz1eWhRy
	2wCbUDvQ/wShb8S8rIneQz1oWQS3ecEtttYKS/XkuDmVEHn3Lg8cRcEztxE3RimjfX/XOl8yGdVog
	ok30bjAp4n0lrT3qWXx+yiyUN3nzrTVnnoYACBp5HSUtc0ZsJeAB1rf2g+KIA3IFjDQtDKPpvcWp6
	eN9vyPuB7KxkFa+HnXInFiThjSpPET1VGMeYHueaLMu1d8KJw+ih77gfJXpSR2nBGBD4LQt+zXr2V
	OKKUAZNfqYTABKvxk/PFfBeyn0zILGlxJoD3We3PEEq/YnJ507zY1Z964J5MSE/KmifVUB7drQWTJ
	K+UivDNA9nRdHSdVZF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psW07-00BpVT-0w
	for ath12k@archiver.kernel.org;
	Fri, 28 Apr 2023 21:51:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psW02-00BpV0-12
	for ath12k@lists.infradead.org;
	Fri, 28 Apr 2023 21:51:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33SJ8Zoj001993;
	Fri, 28 Apr 2023 21:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DA0cuG7nLBg2BApgK8BpmTcdubLUEDaaFzpGpk4P5Uc=;
 b=bW+Gop1oiAB6Wn5of/YclGP2X5yrzds+npxMx6qiduNwTCtDyIe0uFcQGozTZ5UfFer8
 CqLmudYwgS1WI2CmtQE9SlYoZFJKNtvL6KMIMKQQPASdjbIBTcAYbOlezTCfD2Au0QBJ
 umlkxaBItDFkSGOF3t9ez6RIqTfZSE9bIXnrhiIZookCS477sprtSn2Fmg4ZwjFfuZio
 L2sBz8+VOB7roYXalMl6RnL6Cryojyjyv8t7uTgIzmY5C8jDwiYpDEIFcxpfxzkpa8U1
 JzSDzK2R2KxAc6iOf4IaXzku46XBd8yVF5QiKtc/KbLmk7flVmHlCcQo7QS7NBngIJYZ OQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8jun8fn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Apr 2023 21:51:25 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33SLp1Ar014986
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Apr 2023 21:51:01 GMT
Received: from [10.110.11.241] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 28 Apr
 2023 14:51:01 -0700
Message-ID: <e09feed6-1f5e-ab4c-b943-9386fed3d29a@quicinc.com>
Date: Fri, 28 Apr 2023 14:50:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 00/11] wifi: ath12k: (v3) EHT support
Content-Language: en-US
From: Aloka Dixit <quic_alokad@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230413215156.2649-1-quic_alokad@quicinc.com>
 <87ildjtc1c.fsf@kernel.org>
 <759bf2e8-ce51-b882-7d26-7ae57b8cf571@quicinc.com>
In-Reply-To: <759bf2e8-ce51-b882-7d26-7ae57b8cf571@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rxRqN116ytMv7W6NIMkUZfdKK8E9ExeI
X-Proofpoint-ORIG-GUID: rxRqN116ytMv7W6NIMkUZfdKK8E9ExeI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_07,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_145132_642897_D76ACD1D 
X-CRM114-Status: GOOD (  12.93  )
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

T24gNC8yNi8yMDIzIDk6NDkgQU0sIEFsb2thIERpeGl0IHdyb3RlOgo+IE9uIDQvMjUvMjAyMyAx
MTowMyBQTSwgS2FsbGUgVmFsbyB3cm90ZToKPj4gQWxva2EgRGl4aXQgPHF1aWNfYWxva2FkQHF1
aWNpbmMuY29tPiB3cml0ZXM6Cj4+Cj4+PiBBZGQgZHJpdmVyIHN1cHBvcnQgdG8gYnJpbmcgQVAg
dXAgaW4gRUhUIG1vZGUsIGNvbmZpZ3VyZSBhIHByZWFtYmxlCj4+PiBwdW5jdHVyaW5nIGJpdG1h
cCBhbmQgYXNzb2NpYXRlIHdpdGggYW4gRUhUIGNsaWVudC4KPj4+Cj4+PiB2MzogTW9kaWZpZWQg
cGF0Y2hlcyA2IGFuZCA5IHRvIGZpeCBzb21lIGlzc3VlcywKPj4+IGNoYW5nZWxvZyBpbmNsdWRl
ZCBpbiB0aGUgcmVzcGVjdGl2ZSBwYXRjaGVzLgo+Pj4gdjI6IFRoaXMgdmVyc2lvbiBtb2RpZmll
cyBvbmx5IGZldyBjb21taXQgZGVzY3JpcHRpb25zLAo+Pj4gY2hhbmdlbG9nIGluY2x1ZGVkIGlu
IHRoZSByZXNwZWN0aXZlIHBhdGNoZXMuCj4+Pgo+PiBUaGlzIGJyZWFrcyBXQ043ODUwIHN1cHBv
cnQ6Cj4+Cj4+IFvCoCAxNDQuMDM5MTY0XSBhdGgxMmtfcGNpIDAwMDA6MDY6MDAuMDogQkFSIDA6
IGFzc2lnbmVkIFttZW0gCj4+IDB4ZGEyMDAwMDAtMHhkYTNmZmZmZiA2NGJpdF0KPj4gW8KgIDE0
NC4wMzkzMTVdIGF0aDEya19wY2kgMDAwMDowNjowMC4wOiBlbmFibGluZyBkZXZpY2UgKDAwMDAg
LT4gMDAwMikKPj4gW8KgIDE0NC4wNDYyMjBdIGF0aDEya19wY2kgMDAwMDowNjowMC4wOiBIYXJk
d2FyZSBuYW1lOiB3Y243ODUwIGh3Mi4wCj4+IFvCoCAxNDQuMTE4NTM5XSBtaGkgbWhpMDogUmVx
dWVzdGVkIHRvIHBvd2VyIE9OCj4+IFvCoCAxNDQuMTE4NzE2XSBtaGkgbWhpMDogUG93ZXIgb24g
c2V0dXAgc3VjY2Vzcwo+PiBbwqAgMTQ0LjIyMjMwM10gbWhpIG1oaTA6IFdhaXQgZm9yIGRldmlj
ZSB0byBlbnRlciBTQkwgb3IgTWlzc2lvbiBtb2RlCj4+IFvCoCAxNDQuNjI3NzEyXSBhdGgxMmtf
cGNpIDAwMDA6MDY6MDAuMDogY2hpcF9pZCAweDIgY2hpcF9mYW1pbHkgMHg0IAo+PiBib2FyZF9p
ZCAweDEwNCBzb2NfaWQgMHg0MDE3MDIwMAo+PiBbwqAgMTQ0LjYyNzk0NV0gYXRoMTJrX3BjaSAw
MDAwOjA2OjAwLjA6IGZ3X3ZlcnNpb24gMHgxMDA1YmMxMiAKPj4gZndfYnVpbGRfdGltZXN0YW1w
IDIwMjItMTAtMTEgMTI6MTMgZndfYnVpbGRfaWQgCj4+IFFDX0lNQUdFX1ZFUlNJT05fU1RSSU5H
PVdMQU4uSE1ULjEuMC0wMzQyNy1RQ0FITVRTV1BMX1YxLjBfVjIuMF9TSUxJQ09OWi0xLjE1Mzc4
LjQKPj4gW8KgIDE0NC45NTkxOTZdIGF0aDEya19wY2kgMDAwMDowNjowMC4wOiBmYWlsZWQgdG8g
cGFyc2UgdGx2IC0yMgo+PiBbwqAgMTQ0Ljk1OTMxN10gYXRoMTJrX3BjaSAwMDAwOjA2OjAwLjA6
IGZhaWxlZCB0byBwYXJzZSBleHQyIGV2ZW50IHRsdiAKPj4gLTIyCj4+IFvCoCAxNTAuMjYzNTY3
XSBhdGgxMmtfcGNpIDAwMDA6MDY6MDAuMDogZmFpbGVkIHRvIHJlY2VpdmUgd21pIHNlcnZpY2Ug
Cj4+IHJlYWR5IGV2ZW50OiAtMTEwCj4+IFvCoCAxNTAuMjc2NTQ3XSBhdGgxMmtfcGNpIDAwMDA6
MDY6MDAuMDogZmFpbGVkIHRvIHN0YXJ0IGNvcmU6IC0xMTAKPj4KPiAKPiBJIGhhdmUgc3RhcnRl
ZCBzZWVpbmcgRVRJTUVET1VUIG9uIFFDTjkyNzQgYXMgd2VsbCwgQVAgYnJpbmcgdXAgZmFpbHMg
aW4gCj4gdmRldiBzeW5jLiBJdCB3b3JrcyBpZiB0aGUgc3luYyB0aW1lb3V0IGlzIGluY3JlYXNl
ZC4KPiAKCkp1c3QgYW4gdXBkYXRlLCB0aGlzIGlzIHRoZSB0aW1lb3V0IGZpeCByZXF1aXJlZCBm
b3IgUUNOOTI3NDoKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdp
cmVsZXNzL3BhdGNoLzIwMjMwNDI4MDkxMDQxLjIwMDMzLTEtcXVpY19yZ25hbmFzZUBxdWljaW5j
LmNvbS8KClRoZXJlIGFyZSBhbHNvIHNvbWUgY2hhbmdlcyByZXF1aXJlZCBmcm9tIFdDTiBzaWRl
IGFzIHdlbGwuCldpbGwgdXBkYXRlIGhlcmUgd2l0aCBhIGxpbmsgd2hlbiB0aG9zZSBhcmUgYXZh
aWxhYmxlLgpUaGFua3MuCgotLSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMmsK

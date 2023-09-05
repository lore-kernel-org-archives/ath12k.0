Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B78ECA0FF7
	for <ath12k@archiver.kernel.org>; Tue,  5 Sep 2023 18:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+dEW8kVTjt+kFbnaZvJcGRAPfH3q0CpHHnfS7r2N5I=; b=42iH4gWdhyG1wb
	zyNSQkc7kSfo5oYau0YU8XEWAdAkvAVGV4ggcKVX5O/idQ8CP0dvX3ZWfI3aHFqTm9HudBj7oUwco
	RZ+X3l860sOt5uppvicCbGk8RJr3cQ9S/3nxzpiVrTJJRjoAnp8r5d3SBANiaodGsQ19O3PfKmruB
	8IayvZ8xqNa9IYSUKIzxe/4TnUYSSk7bJ4+wqwBPCrV+dGsMJkMmRZOwgBtWTCpGpQ7GgJgWzVmhP
	6LVnr0ia5LTOJQUfsVFTNfNzp/9prJBaLDWIQHJIuY/xJmst10cHNzWHjRch5uPz6OhMExSbnutYW
	jAoP1ntaWxDhdr6PJm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdanJ-006WyJ-2F
	for ath12k@archiver.kernel.org;
	Tue, 05 Sep 2023 18:28:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdanH-006Wxg-0X
	for ath12k@lists.infradead.org;
	Tue, 05 Sep 2023 18:28:56 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385HN4lL001227;
	Tue, 5 Sep 2023 18:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iAi8u8zQIjOkxgowa2A9ZQ3QoTAvWBnfwkqUcTHHkvw=;
 b=ZgWghoRIbB/LM6FSK2nJJhNrFnapxEngxfsEyaejG2IUNkEoNfLcjcgLQw5ekgq2p5jv
 zoDmwT9RDZfvhfkwj5QB0Klj2my11nnoj9mqyaL1rDzTHPXIcu02Y49uYK24KBaLkY4h
 k1rMyEBnlPoJ71e6QLY1e6ZmaLqifekv0GpPotoidDHq7KNf+rO1nm/2+6rEdMBLPhvw
 THz1uLDwRuIRZ7BapDW1zmBOjv5CNYMtVWB0baGD8SWlF6n5xXqOpWJOXVbLEaaEkBVb
 5jplkJ25IeG8H/zf3EejMNMkxzNr7BbeEz8W7Y/IV9Tx5kTHJphoRDQ22ONnt0HlTUwC Tg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3swpr6j8fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 18:28:52 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 385ISpke002765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Sep 2023 18:28:51 GMT
Received: from [10.227.111.113] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 5 Sep
 2023 11:28:51 -0700
Message-ID: <bddf5e10-fe6d-4e7d-b4f0-49b27db3f3fd@quicinc.com>
Date: Tue, 5 Sep 2023 11:27:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Set default beacon mode to burst mode
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230830194617.26400-1-quic_sidhanta@quicinc.com>
 <d4ea2c1b-a142-1ce6-9566-7f501a30f533@quicinc.com>
Content-Language: en-US
From: Sidhanta Sahu <quic_sidhanta@quicinc.com>
In-Reply-To: <d4ea2c1b-a142-1ce6-9566-7f501a30f533@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lq_6abZaATkADSgjfQU5LlqiFsW6-89U
X-Proofpoint-GUID: lq_6abZaATkADSgjfQU5LlqiFsW6-89U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_11,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309050160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_112855_350975_1FA8CB2F 
X-CRM114-Status: GOOD (  17.42  )
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

T24gOC8zMC8yMDIzIDg6NDkgUE0sIEFkaXR5YSBLdW1hciBTaW5naCB3cm90ZToKPiBPbiA4LzMx
LzIzIDAxOjE2LCBTaWRoYW50YSBTYWh1IHdyb3RlOgo+PiBDdXJyZW50bHksIGZpcm13YXJlIGRv
ZXMgbm90IGxpa2Ugd2hlbiBiZWFjb24gbW9kZSBpcyBzZXQgYXMgc3RhZ2dlcmVkCj4+IG1vZGUg
Zm9yIG1vcmUgdGhhbiBvbmUgYmVhY29uaW5nIHZpZnMuIEJlYWNvbiBtb2RlIGZvciBtdWx0aXBs
ZQo+PiBiZWFjb25pbmcgKHRyYW5zbWl0dGVkKSB2aWZzIGFyZSBleHBlY3RlZCB0byBiZSBpbiBi
dXJzdCBtb2RlLiBTbyBzZXQKPj4gYmVhY29uIG1vZGUgdG8gYnVyc3QgbW9kZSBieSBkZWZhdWx0
Lgo+Pgo+PiBUZXN0ZWQtb246IFFDTjkyNzQgaHcyLjAgUENJIFdMQU4uV0JFLjEuMC4xLTAwMDI5
LVFDQUhLU1dQTF9TSUxJQ09OWi0xCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNpZGhhbnRhIFNhaHUg
PHF1aWNfc2lkaGFudGFAcXVpY2luYy5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoMTJrL21hYy5jIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL2F0aC9hdGgxMmsvbWFjLmMgCj4+IGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDEyay9tYWMuYwo+PiBpbmRleCAxYmI5ODAyZWY1NjkuLmIxNmNiYzNjOTA2ZCAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9tYWMuYwo+PiArKysgYi9kcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL21hYy5jCj4+IEBAIC0yMzE0LDcgKzIzMTQsNyBA
QCBzdGF0aWMgdm9pZCAKPj4gYXRoMTJrX21hY19vcF9ic3NfaW5mb19jaGFuZ2VkKHN0cnVjdCBp
ZWVlODAyMTFfaHcgKmh3LAo+PiDCoCDCoMKgwqDCoMKgIGlmIChjaGFuZ2VkICYgQlNTX0NIQU5H
RURfQkVBQ09OKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwYXJhbV9pZCA9IFdNSV9QREVWX1BB
UkFNX0JFQUNPTl9UWF9NT0RFOwo+PiAtwqDCoMKgwqDCoMKgwqAgcGFyYW1fdmFsdWUgPSBXTUlf
QkVBQ09OX1NUQUdHRVJFRF9NT0RFOwo+PiArwqDCoMKgwqDCoMKgwqAgcGFyYW1fdmFsdWUgPSBX
TUlfQkVBQ09OX0JVUlNUX01PREU7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBhdGgxMmtf
d21pX3BkZXZfc2V0X3BhcmFtKGFyLCBwYXJhbV9pZCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFyYW1fdmFsdWUsIGFyLT5wZGV2LT5wZGV2
X2lkKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4gSW4gZWxzZSBwYXJ0LCB3ZSBo
YXZlIGEgZGVidWcgcHJpbnQuIElNSE8gdGhhdCBzaG91bGQgYmUgY2hhbmdlZCB0b28uIAo+IFBs
ZWFzZSBjaGVjayBvbmNlLgo+Cj4gwqDCoMKgwqDCoMKgwqAgZWxzZQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYXRoMTJrX2RiZyhhci0+YWIsIEFUSDEyS19EQkdfTUFDLAo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiU2V0IHN0YWdnZXJlZCBiZWFjb24gbW9kZSBmb3Ig
VkRFVjogJWRcbiIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFydmlm
LT52ZGV2X2lkKTsKPgo+IENvdWxkIHlvdSBjaGVjayBvbmNlPwpZZXMsIFdpbGwgY2hhbmdlIGl0
IGluIG5leHQgdmVyc2lvbi4KPgo+IEFkaXR5YQoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRo
MTJrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTJrCg==

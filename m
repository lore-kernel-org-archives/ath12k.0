Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF8DC3DA79
	for <ath12k@archiver.kernel.org>; Mon, 15 Jan 2024 07:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECooTonl5aq4Io4iHkns7/dmYJ8pAyOiRyizFgpZfkc=; b=bBKHrprcV9dEn8EAGbdmM+Tgl4
	Okrp4GqwXkIXirsgNowOcbR388dq5pyzEN3+vSqFeEQ/hMt9X43XJgG/+nvrS/6JUPMFUgIc14rrb
	GejaoBa+Vq83PD/bOAGbD5gYSrvF+sr7rXh8X+PhF9w3V8HuPtw00EQVGE66CmC16rKUPlYp65FMw
	i0aF1VvdzJ+rSrHnB77aoIi1HR+T9yjeK9jPpFQD1pgBfVsCKbij2DKycreGTfxUpvp16BsQlsUbB
	BBH62Ir//+J4NpXQlZNi/fsYqVFhxEa3GmUbHCtLWl0+hY1XTL2dAK/81JQqghJHpZECvAjAXZ5K4
	rXiVNLcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPHmu-0089bZ-2J
	for ath12k@archiver.kernel.org;
	Mon, 15 Jan 2024 07:53:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPHmr-0089Xr-1A
	for ath12k@lists.infradead.org;
	Mon, 15 Jan 2024 07:53:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40F7drMV016967;
	Mon, 15 Jan 2024 07:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	qcppdkim1; bh=ECooTonl5aq4Io4iHkns7/dmYJ8pAyOiRyizFgpZfkc=; b=XH
	E0BZ6Vx9KS+k4s8nK5BeOcrzb78sgyG+spQ+CPvND7iMbHPMDRFpuHMIUv+8rZfF
	23lzaLBWwr7mpjgfYym12hLA9Z+87O24Ln6DPvxObSnYas041AZe6YhxG31XSxdP
	C3bA34QdZNLDBVGypnszYCfspbVQj8/vKvN5N7qbJIvIgiSl2f7tJNsEQndiDI5Q
	in2WdT+9tj12Hfai/m1a0kCk+dZM16Wps48L3RMLyn4rIBdHFRQA0GHW9frZaj7e
	Aaz6w936S85/5+WLG4AlWYsJs5qCVlte0cXqXUNlWsFDAdhVFfyg7c/FNsRBN5XA
	uZwljoxC19kRhKx5jdKw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vkme12uvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jan 2024 07:53:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40F7rVpm017510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jan 2024 07:53:31 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 14 Jan 2024 23:53:31 -0800
Received: from nalasex01a.na.qualcomm.com ([fe80::1bb6:d69c:6826:9c1]) by
 nalasex01a.na.qualcomm.com ([fe80::1bb6:d69c:6826:9c1%4]) with mapi id
 15.02.1118.040; Sun, 14 Jan 2024 23:53:30 -0800
From: "Sriram R (QUIC)" <quic_srirrama@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
        "Sriram R (QUIC)"
	<quic_srirrama@quicinc.com>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH 09/12] wifi: ath12k: modify regulatory support for single
 wiphy architecture
Thread-Topic: [PATCH 09/12] wifi: ath12k: modify regulatory support for single
 wiphy architecture
Thread-Index: AQHaREnc+ajB8aFcaUWzmWw+VHM87LDXBEQAgAQJE4A=
Date: Mon, 15 Jan 2024 07:53:24 +0000
Message-ID: <565e97fbb0304a268b591a08b891bb4c@quicinc.com>
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
 <20240111045045.28377-10-quic_srirrama@quicinc.com>
 <9e950030-2781-4fd7-84f1-cb7fd6197e6b@quicinc.com>
In-Reply-To: <9e950030-2781-4fd7-84f1-cb7fd6197e6b@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.48.118]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RhHlcEgG6lQ8TvQSS6c0NB65V2MB6JRJ
X-Proofpoint-ORIG-GUID: RhHlcEgG6lQ8TvQSS6c0NB65V2MB6JRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401150056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_235337_542579_9CDE89B4 
X-CRM114-Status: GOOD (  17.08  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSmVmZiBKb2huc29uIChRVUlDKSA8
cXVpY19qam9obnNvbkBxdWljaW5jLmNvbT4NCj5TZW50OiBGcmlkYXksIEphbnVhcnkgMTIsIDIw
MjQgMTE6NDYgUE0NCj5UbzogU3JpcmFtIFIgKFFVSUMpIDxxdWljX3NyaXJyYW1hQHF1aWNpbmMu
Y29tPjsgYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj5DYzogbGludXgtd2lyZWxlc3NAdmdl
ci5rZXJuZWwub3JnDQo+U3ViamVjdDogUmU6IFtQQVRDSCAwOS8xMl0gd2lmaTogYXRoMTJrOiBt
b2RpZnkgcmVndWxhdG9yeSBzdXBwb3J0IGZvciBzaW5nbGUgd2lwaHkNCj5hcmNoaXRlY3R1cmUN
Cj4NCj5PbiAxLzEwLzIwMjQgODo1MCBQTSwgU3JpcmFtIFIgd3JvdGU6DQo+PiBXaXRoIGFsbCB0
aGUgcmFkaW9zIGJlaW5nIGNvbWJpbmVkIGFuZCByZWdpc3RlcmVkIGFzIGEgc2luZ2xlDQo+PiBt
YWM4MDIxMSBody93aXBoeSwgc2VwYXJhdGUgcmVnZCBidWlsdCBmcm9tIGZpcm13YXJlIHJ1bGVz
IG5lZWQgbm90IGJlDQo+PiB1cGRhdGVkIHRvIGNmZzgwMjExLiBSYXRoZXIgd2UgY2FuIHBpY2sg
b25lIG9mIHRoZSByZWdkIGJ1aWx0IGZyb20gdGhlDQo+PiBydWxlcyB0byB1cGRhdGUgdG8gY2Zn
ODAyMTEgZm9yIHRoZSB3aG9sZSByZWdpc3RlcmVkIGRldmljZS4gV2UgcHJlZmVyDQo+PiA2IEdI
eiBwZGV2IGJhc2VkIHJ1bGVzIHNpbmNlIGl0IGhhcyB0aGUgcnVsZXMgZm9yIGFsbCBiYW5kcy4g
SWYgdGhlIGh3DQo+PiBkb2Vzbid0IHN1cHBvcnQgNiBHSHosIHRoZW4gdXBkYXRlIHJ1bGVzIGZy
b20gb25lIG9mIHRoZSBwZGV2cy4NCj4NCj5EbyB5b3UgbmVlZCB0byBoYW5kbGUgdGhlIGNhc2Ug
d2hlcmUgdGhlcmUgYXJlIG11bHRpcGxlIGluc3RhbmNlcyBvZiBoYXJkd2FyZQ0KPnRoYXQgaGF2
ZSBkaXZlcmdlbnQgcmVnZHM/IEknbSB0aGlua2luZyBvZiBhIGNhc2Ugd2hlcmUgdGhlcmUgYXJl
IDMgdW5kZXJseWluZw0KPmhhcmR3YXJlIHBsYXRmb3Jtcywgb25lIHRoYXQgaXMgMiBHSHosIG9u
ZSB0aGF0IGlzIDUgR0h6LCBhbmQgb25lIHRoYXQgaXMgNiBHSHosIGFuZA0KPmVhY2ggb2YgdGhl
bSBoYXMgYSByZWdkIHRoYXQgb25seSBoYXMgdGhlIHJ1bGVzIGZvciB0aGUgc3VwcG9ydGVkIGJh
bmQuIEluIHN1Y2ggYQ0KPmNhc2Ugd291bGRuJ3QgeW91IG5lZWQgdG8gYWdncmVnYXRlIHRoZSBy
dWxlcyBpbiB0aGUgd2lwaHksIG5vdCBqdXN0IHBpY2sgb25lIG9mIHRoZQ0KPnNldHMgb2YgcnVs
ZXM/DQo+DQo+SWYgdGhhdCBpcyBub3QgYW4gZXhwZWN0ZWQgY2FzZSwgaWRlYWxseSB5b3Ugc2hv
dWxkIGRlc2NyaWJlIHRoZSByZXF1aXJlbWVudHMgJg0KPmFzc3VtcHRpb25zIHRoYXQgYXJlIGlu
IHBsYXkgaGVyZS4NClRoaXMgaXMgbm90IGFuIGV4cGVjdGVkIGNhc2Ugd2l0aCBvdXIgdW5kZXJz
dGFuZGluZyBhbmQgdGVzdGluZyBzbyBmYXIuIFRoZSAyR0h6IGFuZCA1R0h6IHJhZGlvIEZXDQog
d291bGQgcGFzcyB0aGUgcmVnZCBjb21wcmlzaW5nIGJvdGggMkdIeiwgIDVHSHouIFRoZSAgNkdI
eiBGVyBpcyBwYXNzaW5nIGFsbCBvZiB0aGVtIC0gMiw1LDZHSHosIGhlbmNlDQp0aGUgbmVlZCB0
byBjbHViIGFsbCB0aGUgcmVnZCBpbmZvIHNlcGFyYXRlbHkgaXMgbm90IHJlcXVpcmVkLiBJIHdp
bGwgbWFrZSB0aGlzIGFzc3VtcHRpb24gY2xlYXIgaW4gdGhlIG5leHQgcmV2aXNpb24uDQo+DQo+
Pg0KPj4gQWxzbywgd2hlbiByZWd1bGF0b3J5IG5vdGlmaWNhdGlvbiBpcyByZWNlaXZlZCwgdXBk
YXRlIHRvIGFsbCB0aGUNCj4+IHVuZGVybHlpbmcgcmFkaW9zL2FyIHNvIHRoYXQgaXQgYmVjb21l
cyBhd2FyZSBvZiB0aGUgY2hhbmdlIGFuZCBhcw0KPj4gd2VsbCB1cyBpdCB1cGRhdGVzIGl0cyBs
b2NhbCByZWdkIHdpdGggdGhlIG5ldyBjb3VudHJ5IHJ1bGVzLiBMYXRlcg0KPj4gcGljayB0aGUg
YXBwcm9wcmlhdGUgcGRldidzIHJlZ2QoNiBHSHogaWYgYXZhaWxhYmxlKSBhbmQgYXBwbHkgdG8N
Cj4+IGNmZzgwMjExLg0KPg0KPkhlcmUgYWdhaW4sIGNhbiB5b3UgZWxhYm9yYXRlIG9uIHRoZSBy
ZXF1aXJlbWVudHMgYW5kIGFzc3VtcHRpb25zPyBEbyB5b3UNCj51cGRhdGUgYWxsIGNoYW5uZWxz
IHRvIGVhY2ggaGFyZHdhcmUsIGV2ZW4gaWYgZWFjaCBoYXJkd2FyZSBvbmx5IHN1cHBvcnRzIGEN
Cj5zaW5nbGUgYmFuZD8NCkJ5IHVwZGF0ZSBkdXJpbmcgcmVnX25vdGlmaWVyIGhlcmUgd2UgbWVh
biB0aGUgY291bnRyeSBjb2RlIGFsb25lIHRvIGVhY2ggb2YgdGhlIEZXDQphbmQgdGhlIGNoYW5u
ZWwgbGlzdCB1cGRhdGUgb24gcmVjZWl2aW5nIHRoZSByZWdkIHdvdWxkIHVwZGF0ZSBvbmx5IHRo
ZSBjb3JyZXNwb25kaW5nDQpzdXBwb3J0ZWQgY2hhbm5lbHMgdG8gdGhlIHJlc3BlY3RpdmUgRlcg
YW5kIG5vdCB0aGUgY29tYmluZWQgbGlzdC4NCg0KVGhhbmtzLA0KU3JpcmFtLlINCg==


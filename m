Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A52C001B0
	for <ath12k@archiver.kernel.org>; Fri, 11 Aug 2023 09:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5x1vyBJPUoqHMAQ1BV+WVmjCqD1P+nf9VVKgLDKdX4=; b=lqTtHfr69cUPvw
	xk5cAYdBmhZfMbEw7u+MVPnptZQq0vgxAmtVmRgwJNPIidL6mFajf31jC4nuVfAss0T8xhiR2RW1f
	X1kDN+DDLPNNVcq2dch6c+Y9ZMf33wUgUXsdQwtSESjj7orQecQFZBdwpOxLyt7tN0AFhUdyHieg7
	FgmAYfmWyjYst6bvRGMgkqLYnTUFN1Jd+I5b0ZhVZQCixWwOBC+4vQvS/6ygWD596t6Hn8Hkk85R4
	QNp49flCfGC0wAREgHixG/ouY+fynPmmfiQpIizBYsf7u6nx10xgPPPXn+xfr29J1/TrYnmqpYXhe
	zAc9ykQMl2J6JoJ5ja1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOqe-00A46E-38
	for ath12k@archiver.kernel.org;
	Fri, 11 Aug 2023 09:54:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOqb-00A45X-1q
	for ath12k@lists.infradead.org;
	Fri, 11 Aug 2023 09:54:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37B4vDM9029032;
	Fri, 11 Aug 2023 09:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=czV3SHta8Iw3Ga3vbsaBj6VIqSHhqc4SyELz2wDepHk=;
 b=ZUo3F59eHX6qssrWlLoNsr9odQimEJVjCop1DvDFpZ2J2A28SA3QeMCrACmTsND5MbWp
 dlVGlsVp6rWNiaAadzJqcLYVsI4jfqCCDv6WlvXHZYKWi7Y9e1ecX1Paa/Ssg46ZxPew
 4j99lw5TB/sWIZuav3fiQrfiw07TzBdmYHGMHr8LXY+xRf8ZKRBkPD2f914aljf7d3F/
 LW1Fsh/aAnZ5SkdTK/BMZekncW0NRi84t4M6gzPI/klkz1M3NOOlKhHbWmv5oHXnzaP7
 2rtvlPRQkrIfcobXu09lGq6T6ZTmkiGwW88sszqwXu9xe4wmXfpt+8T/TS0mBMxrnvZs wA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sd8ywh9en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 09:54:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37B9sItM029246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 09:54:18 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 11 Aug
 2023 02:54:17 -0700
Message-ID: <f29e5ba9-ef30-b954-7608-79604930ac1c@quicinc.com>
Date: Fri, 11 Aug 2023 17:54:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 61/76] wifi: nl80211: add EML/MLD capabilities to
 per-iftype capabilities
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>, <quic_rkaliapp@quicinc.com>
References: <20220713094502.163926-1-johannes@sipsolutions.net>
 <20220713114426.4dfc9ebd0461.Ice7b841051cfeb23da17bb2caa0e45191b34c4db@changeid>
 <d2f17799-6d90-9d72-a389-565163d723d2@quicinc.com>
 <f577425e2d4fd6141c29bcbfbea919565da9326d.camel@sipsolutions.net>
 <cc6b83eb-ac30-34fc-4827-290a9ae25378@quicinc.com>
 <8627bb8a3dddc33be7f1f97f30fc0f716328ff81.camel@sipsolutions.net>
 <29ab2b41-0adf-3a04-6eb9-3d5666253eb9@quicinc.com>
 <1ec93eca79a7bc96c1498b771c3b6ea2ebc78d95.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <1ec93eca79a7bc96c1498b771c3b6ea2ebc78d95.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G3XRzibD2U1mNEub9tecomQdaCxohTIo
X-Proofpoint-GUID: G3XRzibD2U1mNEub9tecomQdaCxohTIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_20,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=532 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308110089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_025421_760112_29D7D0FC 
X-CRM114-Status: GOOD (  17.86  )
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

T24gOC8xMS8yMDIzIDU6MjcgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gRnJpLCAyMDIz
LTA4LTExIGF0IDE3OjI0ICswODAwLCBXZW4gR29uZyB3cm90ZToKPgpbLi4uXQo+IE9LLCBhdCBs
ZWFzdCB0aGF0IGFuc3dlcnMgdGhlIHF1ZXN0aW9uIHdoYXQgeW91J2Qgd2FudCB0byBkbyB3aXRo
IGl0IDopCj4KPj4gRm9yIGR5bmFtaWMgbGluayBjaGFuZ2UsIGl0IGlzIGFub3RoZXIgbmV3IHRv
cGljLCBzbyBJIGhhdmUgbm90IGdvb2QgYWR2aXNlCj4+IGZvciB0aGF0LvCfmIEKPiBCdXQgZXZl
cnlvbmUncyBsb29raW5nIGF0IHRoYXQ/Ckkgc2VlIHRoZXJlIGhhcmUgc29tZSBwYXRjaGVzIGlu
IG1hYzgwMjExL2NmZzgwMjExIGZvciBkeW5hbWljIGxpbmsgCnJlbW92YWwgc3VjaCBhcwoid2lm
aTogbWFjODAyMTE6IFN1cHBvcnQgbGluayByZW1vdmFsIHVzaW5nIFJlY29uZmlndXJhdGlvbiBN
TCBlbGVtZW50Ii4gCkZvciBsaW5rCnJlbW92YWwsIGl0IGRvZXMgbm90IGVmZmVjdCB0aGUgRU1M
IGlzc3VlIEkgc2FpZC4gT25seSBsaW5rIGFkZCAKb3BlcmF0aW9uIHdpdGhvdXQgKHJlKWFzc29j
CigzNS4zLjYgTUwgcmVjb25maWd1cmF0aW9uIG9mIElFRUUgUDgwMi4xMWJl4oSiL0QzLjIgZGlz
YWxsb3cgKHJlKWFzc29jIApmb3IgbGluayBhZGQpCndpbGwgaW1wYWN0IHRoZSBFTUwgaXNzdWUg
SSBzYWlkLiBCdXQgSSBkaWQgbm90IHNlZSBkeW5hbWljIGxpbmsgYWRkIApwYXRjaCBub3cuIFdp
bGwKeW91IGFsc28gZG8gdGhlIHBhdGNoZXMgZm9yIGR5bmFtaWMgbGluayBhZGQgd2l0aG91dCAo
cmUpYXNzb2M/Cj4KPiBIb25lc3RseSBJJ20gbm90IGV2ZW4gc3VyZSAtIGFuZCB5b3UgbWlnaHQg
a25vdyBiZXR0ZXIgLSB3aGF0IHRoZSBFTUwKPiBjYXBhYmlsaXRpZXMgbWF0dGVyIGZvciBpZiB5
b3UgbmV2ZXIgZW5hYmxlIEVNTC4KPgo+IFNvIGFsbW9zdCBmZWVscyBsaWtlIGlmIHlvdSBuZXZl
ciBzZW5kIHRoZSBFTUwgT01OIGZyYW1lICh0aGFua3MgZm9yIHRoZQo+IG5hbWUhKSB0aGUgQVAg
d291bGRuJ3QgcmVhbGx5IGNhcmUsIGFuZCB0aGF0J3Mgc29tZXRoaW5nIHlvdSBjb3VsZCBkbwo+
IHZlcnkgZWFzaWx5IHdpdGhvdXQgY2hhbmdpbmcgaXQsIGkuZS4geW91IHByZXRlbmQgdGhhdCB5
b3VyIDIuNCBHSHoKPiBhY3R1YWxseSBoYXMgRU1MLCB5b3UganVzdCBuZXZlciBlbmFibGUgaXQg
aW4gY2FzZSAyLjQgR0h6IGlzIGFjdGl2ZT8KWW91ciBhZHZpc2UgbWF5YmUgZmVhc2libGUuIFRo
ZW4gbm8gY2hhbmdlIGlzIG5lZWRlZCBpbiBubDgwMjExIGhlcmUgZm9yIAp0aGUgRU1MLgo+IGpv
aGFubmVzCgotLSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK

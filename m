Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13C3C0015E
	for <ath12k@archiver.kernel.org>; Fri, 11 Aug 2023 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKBLvY4pyf4iYAOEM1+tHSCLiLaywljA03j5ypYiS1g=; b=XWJfUu1PO/gqni
	NC0nY182mo+NrwZ41e1J5Td6cz1yUpboRmbEyM0tSX0EpD26tAKSZg3i9F9mR3XSFZmo4bVX1Eyqd
	aXvzKlmRRatUB543lDbMOSWZFIzXyWc0ExUZZxvYydw4e/wXmwEXIpoY0NFKv877n2zkTXZXX1lPA
	cTD+1mT32bcDa3aPKvrYwV9nGS9FIsHnrWpz5mmusO5yc0ItUj1U7SYaErAiQlQXfRH4YTjBlEhrr
	IXrpbYppYoe4fU6wN4qVbZfrR1bOxcJa8D9FTJekZvR+RTz9FvvSnFFHxMe3978mzDS8BAAyg3lwq
	/XSl0ZO8iONSP4iOljTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOO9-009xUc-1X
	for ath12k@archiver.kernel.org;
	Fri, 11 Aug 2023 09:24:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOO6-009xTP-38
	for ath12k@lists.infradead.org;
	Fri, 11 Aug 2023 09:24:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37B46rnl023427;
	Fri, 11 Aug 2023 09:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Fik4AOmkAiuXh6Y+8wsosQLraV2ygOWCdEQUeMqhDYY=;
 b=gu9ErSiLlX0yoIIvBFXrPaqCs53XuhCdDf1eCUJ9s4Jm5Mq2g7ivjkBHjRULMgt0G1Mh
 nT20ANuGwQEI4dV1ugXwPbLLnX3iP0TPORim0R1AHIYuB2M/7ev77YyhAWEMV2o9V6Gw
 rM4L+5tlDkx21y5wqU/bzU9oRkxBB+U2Z+SrG/5DWpWb3tfww5kGlamwVIyr888aA+Gu
 dM0ERT49KiGuV3NGiQF7KBpbnzMxabfiE7GFix/0+DiPxnKHV3uQ6CvDIN/UFbeE00VW
 NBH5PAlZhU2v5LI1RgVioV+0Y2AvCMPZTm7B2QxL6MBKlXP7jvShW+0OZ+iqdfutwXM/ 2Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sd90616t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 09:24:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37B9OqIi021984
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 09:24:52 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 11 Aug
 2023 02:24:51 -0700
Message-ID: <29ab2b41-0adf-3a04-6eb9-3d5666253eb9@quicinc.com>
Date: Fri, 11 Aug 2023 17:24:48 +0800
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
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <8627bb8a3dddc33be7f1f97f30fc0f716328ff81.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gNemDvBs5srueKs-s-6bZx7plnwrq18R
X-Proofpoint-ORIG-GUID: gNemDvBs5srueKs-s-6bZx7plnwrq18R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_20,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 clxscore=1015 spamscore=0
 mlxlogscore=632 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308110085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_022455_122497_C5812F46 
X-CRM114-Status: GOOD (  21.74  )
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

T24gOC8xMS8yMDIzIDU6MDggUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gRnJpLCAyMDIz
LTA4LTExIGF0IDE3OjA1ICswODAwLCBXZW4gR29uZyB3cm90ZToKPj4gT24gOC8xMS8yMDIzIDU6
MDMgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4+PiBPbiBGcmksIDIwMjMtMDgtMTEgYXQgMTE6
NTEgKzA4MDAsIFdlbiBHb25nIHdyb3RlOgo+Pj4+IE5vdyB0aGVyZSBhcmUgbWFueSBubDgwMjEx
X2JhbmQgc3VjaCBhcyBOTDgwMjExX0JBTkRfMkdIWi8KPj4+PiBOTDgwMjExX0JBTkRfNUdIWi9O
TDgwMjExX0JBTkRfNkdIWi4uLiBJbiB0aGUgc2FtZSBpbnRlcmZhY2UsIGlmIHNvbWUgYmFuZHMK
Pj4+PiBzdXBwb3J0IEVNTCwgYW5kIG90aGVyIGJhbmRzIG5vdCBzdXBwb3J0IEVNTCwgdGhlbiBo
b3cgdG8gaGFuZGxlciB0aGlzCj4+Pj4gY2FzZT8KPj4+IEJ1dCAuLi4gdGhlc2UgYXJlIE1MRCBj
YXBhYmlsaXRpZXMsIG5vdCBvZiB0aGUgKGFzc29jaWF0ZWQpIFNUQT8KPj4gWWVzLCBJIGtub3cg
aXQuCj4gVGhlbiB5b3UgY2FuJ3QgaG9uZXN0bHkgYmUgc3VnZ2VzdGluZyB3ZSBtb3ZlICJNTEQg
Y2FwYSBhbmQgb3BzIiBpbnRvCj4gcGVyLWJhbmQsIG5vPwpJIGtub3cgaXQganVzdCBub3cgYWZ0
ZXIgSSBzZW5kIHRoZSBzdWdnZXN0aW9u8J+YgQo+Pj4gU28gbm90IHN1cmUgaG93IHRoYXQgd291
bGQgbWFrZSBzZW5zZT8gV2hhdCB3b3VsZCB5b3UgZXZlbiBfZG9fIHdpdGgKPj4+IHRoYXQ/Cj4+
IEkgdGhpbmsgYW5vdGhlciBjaGFuZ2UgaXMgbm90IG1vdmUgInUxNiBlbWxfY2FwYWJpbGl0aWVz
IiwgYW5kIG9ubHkgYWRkCj4+IGEgbmV3Cj4+IGZpZWxkICJ1MTYgZW1sX3N1cHBfYmFuZHMiIHRv
Z2V0aGVyIHdpdGggdGhlICJ1MTYgZW1sX2NhcGFiaWxpdGllcyIsIHRoZQo+PiBlbWxfc3VwcF9i
YW5kcyBpcyBmaWxsZWQgd2l0aCB0aGUgYml0IG1hcCBvZiBlbnVtIG5sODAyMTFfYmFuZC4gSXMg
dGhhdCBPSz8KPj4KPiBBbmQgYWdhaW4sIHdoYXQgd291bGQgeW91IGRvIHdpdGggaXQ/IE5vdCBh
ZHZlcnRpc2UgRU1MIHdoZW4geW91IGhhdmUKPiBzZWxlY3RlZCBsaW5rcyB0aGF0IGFyZSBub3Qg
aW4gdGhlIG1hcD8gQW5kIGlmIHRoZSBsaW5rcyBjaGFuZ2UKPiBkeW5hbWljYWxseSBpbiB0aGUg
ZnV0dXJlPyBZb3UnZCBwcm9iYWJseSBuZWVkIGEgYnVuY2ggb2YgdmFsaWRhdGlvbiBmb3IKPiB0
aGF0LgpGb3IgZXhhbXBsZSwgZm9yIHN0YXRpb24sIE5PVCBzdXBwb3J0IEVNTCBvbiAyIEdIeiwg
c3VwcG9ydCBFTUwgb24gNSAKR0h6LzYgR0h6LgoKV2hlbiBjb25uZWN0IHRvIDIvMyBsaW5rcyBB
UCwgdGhlbiBFTUwgc2hvdWxkIE5PVCBhZGQgaW4gYXNzb2MgcmVxIHdoaWxlIApjb25uZWN0CnRv
IEFQIHdoaWNoIGlzIDIgR0h6KzUgR0h6IG9yIDIgR0h6KzYgR0h6IG9yIDIgR0h6KzUgR0h6KzYg
R0h6LgoKRU1MIHNob3VsZCBhZGQgaW4gYXNzb2MgcmVxIHdoaWxlIGNvbm5lY3QgdG8gQVAgd2hp
Y2ggaXMgNSBHSHorNiBHSHouCgpGb3IgZHluYW1pYyBsaW5rIGNoYW5nZSwgaXQgaXMgYW5vdGhl
ciBuZXcgdG9waWMsIHNvIEkgaGF2ZSBub3QgZ29vZCBhZHZpc2UKZm9yIHRoYXQu8J+YgQo+Cj4g
QW5kIHVzdWFsbHkgeW91J2QgcHJvYmFibHkgYWx3YXlzIGNvbm5lY3QgdG8gYWxsIHRoZSBiYW5k
cz8KPgo+IEkgcmVhbGx5IGRvbid0IGdldCBpdC4KClNvbWV0aW1lcyBBUCBpcyAzIGxpbmtzICgy
IEdIeis1IEdIeis2IEdIeiksIGJ1dCBzdGF0aW9uIG9ubHkgc3VwcG9ydCAyIApsaW5rcywKCnRo
ZW4gc3RhdGlvbiB3aWxsIG5vdCBjb25uZWN0IGFsbCBiYW5kcywgc3RhdGlvbiBuZWVkIGNob29z
ZSAyIGJhbmRzIHRvIApjb25uZWN0LgoKPgo+IEJ0dyB0aGlzIGlzIGFsbCBjbGllbnQgLSBzbyB5
b3VyIGNsaWVudCBpbXBsZW1lbnRhdGlvbiBjYW4ganVzdCBub3Qgc2VuZAo+IHRoZSBFTUwgYWN0
aW9uIGZyYW1lIChmb3Jnb3QgdGhlIG5hbWUgcmlnaHQgbm93KSB3aGVuIHRoZSBjdXJyZW50bHkK
PiBhY3RpdmUgbGlua3MgYXJlIG5vdCBjb21wYXRpYmxlLgpJIGd1ZXNzIHlvdSBhcmUgcmVmZXIg
dG8gIkVNTCBPcGVyYXRpbmcgTW9kZSBOb3RpZmljYXRpb24gZnJhbWUiLgo+IGpvaGFubmVzCgot
LSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK

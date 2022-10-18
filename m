Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DDDC4332F
	for <ath12k@archiver.kernel.org>; Tue, 18 Oct 2022 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5G6ff/Qdq80c9VR9QUIiYBSiChXPw442c8I6fksVCI=; b=HsCvnzdmbz6wGu
	aNBJjfcZxL/ggpUIWeXRdA82QPxc0hFh4SQNo4tfpUcH8RcOXgBTbVYfxgFiSr/B22ALfQJ4DtOXN
	pUIB7WqUTRarwJrWmhI2qQdKR2QOyIG5+S75wZ2oEQLUQsrhm59dw3CJe/bT05tvIcBXM/v0b1ZIL
	l+grycDXw2ovqCuusacg5B2Cw3XgU1vX7azMvPSkzgAToC7pW+mJpqM3p08OJWTAU/O+5vo5Gk/bW
	+HVERSe4VQZUmj+9vhO4/HOM9U63llFXoDB6oJf9APZAyut0df3kA3oTw82i8kdaHJ6/U6gGLnRv2
	H5415/qmVz5KhmpDA5eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjFQ-005Gmy-RV
	for ath12k@archiver.kernel.org; Tue, 18 Oct 2022 09:50:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjFK-005Gjt-9P; Tue, 18 Oct 2022 09:50:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29I8JHAL011807;
	Tue, 18 Oct 2022 09:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=swtDZcSOjcRU1/N/5VrVyp60bjkmh7JSO6Cdb5BBVYc=;
 b=Inr3qq5KFJt+U3iBZyjhvbWrY/1YxTSnE0Af61xV0gAqkhg2rNVtHyIsVawb5OHWtVVf
 l8QlfpSYwBFWRkAP7gwyTUlOvB+064XYOA+oFt2J+ZTJtvRsrJrrxWDy9tO0TdqpRdjw
 TdF8jpYOZb7Py4dz0DKdAWGd9W7uMkT8o0vUtyL92GnTTLl7KiuhwJj4iNFyV/4tvCrV
 Vgl40DhQ4cAr68t7KZD0VavzLwfqKTVAKo4aieovBoY6Gfm8ROI9/YwOJcadTDJ6LRdy
 O5C0ngNku6+NkUtXD06tO2eVAzdKP7Il9q8SICdtD36mKocSqEdIxN0FmDuNL1vL8w/A Ng== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k9jjms4d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 09:50:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29I9okWV016599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 09:50:46 GMT
Received: from [10.253.75.92] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 18 Oct
 2022 02:50:45 -0700
Message-ID: <7e72034a-497a-000c-d7bf-3ec974af9e1c@quicinc.com>
Date: Tue, 18 Oct 2022 17:50:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 01/15] mac80211: split bss_info_changed method
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
References: <20220601073958.8345-1-johannes@sipsolutions.net>
 <20220601093922.347d47c279fe.I15937cfe8405999084f164ddf57390f8b8d2bc61@changeid>
 <c38b4da8-488b-2d09-631a-1bb6c07440a6@quicinc.com>
 <3483d05c1d5a39b9243b54d9f28450344a897655.camel@sipsolutions.net>
 <bd6545a8-57a3-5849-52d5-c1a449ab1712@quicinc.com>
 <d0994456d3a9ea00b5cc472df7822d53d189399e.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <d0994456d3a9ea00b5cc472df7822d53d189399e.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7U9IFpEUqW8WtnXJq_8-eoIfqmU1VeRz
X-Proofpoint-ORIG-GUID: 7U9IFpEUqW8WtnXJq_8-eoIfqmU1VeRz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_03,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 mlxlogscore=605 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210180056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_025050_352048_73F55D2C 
X-CRM114-Status: GOOD (  14.53  )
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

T24gMTAvMTgvMjAyMiA0OjUzIFBNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+IE9uIFR1ZSwgMjAy
Mi0xMC0xOCBhdCAxNjo1MiArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4+IE9uIDEwLzE4LzIwMjIg
NDo1MCBQTSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPj4+IE9uIFR1ZSwgMjAyMi0xMC0xOCBhdCAx
Njo0NyArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4+Pj4+ICsJaWYgKGNoYW5nZWQgJiB+QlNTX0NI
QU5HRURfVklGX0NGR19GTEFHUykgewo+Pj4+PiArCQkvKiBGSVhNRTogc2hvdWxkIGJlIGZvciBl
YWNoIGxpbmsgKi8KPj4+Pj4gKwkJdHJhY2VfZHJ2X2xpbmtfaW5mb19jaGFuZ2VkKGxvY2FsLCBz
ZGF0YSwgMCwgY2hhbmdlZCk7Cj4+Pj4+ICsJCWlmIChsb2NhbC0+b3BzLT5saW5rX2luZm9fY2hh
bmdlZCkKPj4+Pj4gKwkJCWxvY2FsLT5vcHMtPmxpbmtfaW5mb19jaGFuZ2VkKCZsb2NhbC0+aHcs
ICZzZGF0YS0+dmlmLAo+Pj4+PiArCQkJCQkJICAgICAgMCwgY2hhbmdlZCk7Cj4+Pj4gSSB0aGlu
ayB5b3Uvc29tZW9uZSB3aWxsIGNoYW5nZSBoZXJlIGxhdGVyIGZvciB0aGUgIi8qIEZJWE1FOiBz
aG91bGQgYmUKPj4+PiBmb3IgZWFjaCBsaW5rICovIiwgcmlnaHQ/Cj4+PiBNYXliZS4gSSdtIG5v
dCBhY3R1YWxseSBzdXJlIGl0J3MgcmVhbGx5IG5lZWRlZCwgaXQgZGVwZW5kcyBob3cgd2UgdXNl
Cj4+PiB0aGlzIGluIHRoZSBmdXR1cmUuCj4+Pgo+Pj4+IEl0IGxlYWQgZXJyb3Iva2VybmVsIGNy
YXNoIGFzIGJlbG93IHdoaWxlIHJlY29uZmlnIHNpbmdsZSBNTE8gbGluayB3aGljaAo+Pj4+IGxp
bmsgaWQgaXMgMi4KPj4+PiBXaGVuIHRlc3Qgd2l0aCBzaW5nbGUgTUxPIGxpbmsgd2hpY2ggbGlu
ayBpZCBpcyAwLCBub3QgZm91bmQKPj4+PiBlcnJvci9rZXJuZWwgY3Jhc2guCj4+PiBJJ20gbm90
IHN1cnByaXNlZCwgSSBqdXN0IHdvcmtlZCBvbiBmaXhpbmcgcmVjb25maWcgaW4gdGhlIGxhc3Qg
ZmV3Cj4+PiBkYXlzLCB3aWxsIHBvc3QgaXQgYWZ0ZXIgc29tZSBtb3JlIHJldmlldy90ZXN0aW5n
Lgo+PiBUaGFua3MuCj4+PiBTbyBJIHRoaW5rIHRoYXQgbWlnaHQgbm90IG5lZWQgY2hhbmdlcyAq
aGVyZSosIGJ1dCByYXRoZXIgYSBwcm9wZXIgRlcKPj4+IHJlc3RhcnQuIFdoaWNoIEkgaGF2ZW4n
dCB0ZXN0ZWQgaW4gQVAgbW9kZSB0aG91Z2ggLS0gd2FzIHRoZSBjcmFzaCBpbiBBUAo+Pj4gbW9k
ZT8KPj4gSXQgaXMgY3Jhc2ggaW4gc3RhdGlvbiBtb2RlLgo+IHRyeSB0aGlzPwo+Cj4gaHR0cHM6
Ly9wLnNpcHNvbHV0aW9ucy5uZXQvMDY1MmJiYmJlMzUwYjEyNi50eHQKPgo+IGpvaGFubmVzCgpD
b25mbGljdCBoYXBwZW5lZCB3aGlsZSBydW4gImdpdCBhbSIgdGhlIHBhdGNoLgoKQmVjYXVzZSBt
aXNzaW5nIHRoZcKgICJjaGFuZ2VkIHw9IEJTU19DSEFOR0VEX0VIVF9QVU5DVFVSSU5HOyIgaW4g
bXkgCmxvY2FsIGNvZGUsCgphbHNvIGl0IGlzIG1pc3NpbmcgaW4gCmh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3dpcmVsZXNzL3dpcmVsZXNzLW5leHQuZ2l0
L3RyZWUvbmV0L21hYzgwMjExL3V0aWwuYwoKTWF5YmUgImNoYW5nZWQgfD0gQlNTX0NIQU5HRURf
RUhUX1BVTkNUVVJJTkc7IiBpcyBvbmx5IGV4aXN0ZWQgaW4geW91ciAKbG9jYWwgY29kZT8KCgot
LSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK

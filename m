Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54405EE6446
	for <ath12k@archiver.kernel.org>; Fri, 15 Sep 2023 08:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBZ4PtynqF+RaUWWhnU7wdAe5jrtK9mT27NgmLeHgIU=; b=CsoBDEy7Dvn8hp
	tbq/wigA9Pcth8s29KU6K3+hKUFY+NMIiPSK+mruwRJWDUljdjsxaRRRqZ8zfTVMBKVBPRih0/Uvf
	nv8BusTW03lxHAkkNXIXFyAIxPoxu16qD+M5DOA1RtdEs6veldGItZdW18oTiREpTOXM76tfu2c4X
	JZCLo9sJ2OTL4rGv02Ko5AaXtbmgoir11MzDr7yLgYK49xxyLExVx3c+e1lLCHelYAHs0Ith8Wuo1
	Ew0VJ5Q1ptkdG3cwBPRYmH93B9s0rcQwETWALCPqpHWFAXizC28Hizj/Bo/77OZ62FGEAApXLDDnB
	scrQzKh8DYTI9d9BVuSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4Gk-00AA3i-0E
	for ath12k@archiver.kernel.org;
	Fri, 15 Sep 2023 08:33:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4Gg-00AA30-0L
	for ath12k@lists.infradead.org;
	Fri, 15 Sep 2023 08:33:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38F7lM6e001937;
	Fri, 15 Sep 2023 08:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=d6GoOfZPp5VEkUdNwP6AULivoZYPDHWIgGUFmaBrP2A=;
 b=Gm7KgtygTVRSDaM/kna126oh+43twBpPrN+SYFpBzcXQNbj/nlocpF4E4y9pJieC3LlA
 YqEE8duuulH+n7wI1GKs7NX4loxC/bpYvnDj7E3PWbHXnxey2bWpg+vq0p7TTjyrRvlK
 Lk5tUaJ3GVKUKVWLTjNZ20WNuqFPlW/fAlJAIgp0E9P6FvCer6Dxvvni2ckG5RHna3Ws
 cIF+PtCYW/w23D1Tz31UI6Buxnw+h6SB7hy40cs2paZd+c+i6yIFsyd1lT5MKB1DKuuH
 HNRast7pV8mt2mIjR9NpFdXwjCl+c+8ZFkC4gq4GSG/NMkN0ibY3xez6n1lq9y40bf2m HA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g3grft6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 08:33:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38F8XX3W013920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 08:33:33 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 01:33:32 -0700
Message-ID: <96ae3c1d-274b-00b1-cb19-a9a301b6aa56@quicinc.com>
Date: Fri, 15 Sep 2023 16:33:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/3] wifi: mac80211: add support to allow driver to set
 active link while connection for station
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20230906103458.24092-1-quic_wgong@quicinc.com>
 <20230906103458.24092-3-quic_wgong@quicinc.com>
 <4b597bba9dc13c3260f174826de38b4f1bc3bf6e.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <4b597bba9dc13c3260f174826de38b4f1bc3bf6e.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Vvh9bk3Yr0F213uiupCkg-Y6XCmx4Eua
X-Proofpoint-ORIG-GUID: Vvh9bk3Yr0F213uiupCkg-Y6XCmx4Eua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_05,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 mlxlogscore=903 phishscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_013338_262906_837DEE0B 
X-CRM114-Status: GOOD (  23.14  )
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

T24gOS8xMy8yMDIzIDQ6NTggUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gV2VkLCAyMDIz
LTA5LTA2IGF0IDA2OjM0IC0wNDAwLCBXZW4gR29uZyB3cm90ZToKPj4gVGhlcmUgYXJlIDIgZmll
bGRzIHZhbGlkX2xpbmtzIGFuZCBhY3RpdmVfbGlua3MgaW4gc3RydWN0IGllZWU4MDIxMV92aWYK
Pj4gb2YgbWFjODAyMTEuIEZvciBzdGF0aW9uIG1vZGUsIHZhbGlkX2xpbmtzIGlzIGFsd2F5cyBp
bmNsdWRlIHRoZSBiaXRtYXAKPj4gb2YgYWN0aXZlX2xpbmtzLiB2YWxpZF9saW5rcyBzdG9yZXMg
dGhlIGJpdG1hcCBvZiBsaW5rcyB3aGljaCBpcyBjcmVhdGVkCj4+IGluIG1hYzgwMjExLCBhbmQg
bWFjODAyMTEgb25seSBpbmRpY2F0ZSB0aGUgaW5mbyBvZiBsaW5rcyB3aGljaCBpcyBleGlzdGVk
Cj4+IGluIGFjdGl2ZV9saW5rcyB0byBkcml2ZXIuIEZpbmFsbHksIHRoZSBhY3RpdmVfbGlua3Mg
aXMgdGhlIGJpdG1hcCBvZgo+PiBsaW5rcyB3aGljaCBzdGF0aW9uIGNhbiBpbnRlcmFjdGl2ZSB3
aXRoIE1MTyBBUCBpdCBpcyBjb25uZWN0ZWQgdG8uCj4+Cj4+IEN1cnJlbnRseSB0aGUgYWN0aXZl
IGxpbmtzIGlzIGFsd2F5cyBvbmx5IGNvbnRhaW4gdGhlIHByaW1hcnkgbGluaywKPj4gcHJpbWFy
eSBsaW5rIG1lYW5zIHRoZSBsaW5rIHVzZWQgYnkgdGhlIGxhdGVzdCBleGNoYW5nZSBvZiBzdWNj
ZXNzZnVsCj4+IChSZSlBc3NvY2lhdGlvbiBSZXF1ZXN0L1Jlc3BvbnNlIGZyYW1lcy4gVGhlbiBp
dCB3aWxsIGFsd2F5cyBoYXZlIG9ubHkKPj4gb25lIGxpbmsgaW4gZHJpdmVyIGFmdGVyIGNvbm5l
Y3RlZC4KPj4KPj4gSGVuY2UgYWRkIHRoaXMgb3BzIGluIHN0cnVjdCBpZWVlODAyMTFfb3BzIHRv
IGFsbG93IGRyaXZlciB0byBkZXRlcm1pbmUKPj4gdGhlIGFjdGl2ZSBsaW5rcyBiaXQgbWFwIGR5
bmFtaWNhbGx5IHdoaWxlIGNvbm5lY3RpbmcgdG8gTUxPIEFQLgo+IFRoaXMgY29tbWl0IGxvZyBk
b2VzIG5vdGhpbmcgdG8gYWRkcmVzcyB0aGUgcXVlc3Rpb24gIndoeSBkbyB3ZSBuZWVkCj4gdGhp
cyIsIHBhcnRpY3VsYXJseSBzaW5jZSB3ZSBhbHJlYWR5IGhhdmUKPiBpZWVlODAyMTFfc2V0X2Fj
dGl2ZV9saW5rcygvX2FzeW5jKSwgc28gdGhlIGRyaXZlciBjYW4gcHJldHR5IG11Y2gKPiBpbW1l
ZGlhdGVseSBlbmFibGUgYWxsIHRoZSBsaW5rcyBpdCB3YW50cy4KPgo+IEkgc2VlIG5vIHZhbHVl
IGluIHRoaXMgcGF0Y2ggd2hhdHNvZXZlci4KRm9yIGllZWU4MDIxMV9zZXRfYWN0aXZlX2xpbmtz
KCksIGRyaXZlciBuZWVkIHNhdmUgYW5kIGluc3RhbGwgcGFpcndpc2UKa2V5cyBmb3IgdGhlIG90
aGVyIGxpbmtzIGFzIHlvdSBzYWlkIGluIGxpbmsgYmVsb3cuIEJ1dCBkcml2ZXIgZG8gbm90CnNh
dmUgdGhlIGtleSBkYXRhIGN1cnJlbnRseS4gU28gZHJpdmVyIGNvdWxkIG5vdCBpbnN0YWxsIHRo
ZSBwYWlyd2lzZQprZXlzIGJ5IGl0c2VsZi4KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
d2lyZWxlc3MvNTA3MTlkMzRiYzQ4ZDgxNmQwMGI1NmQzZDllZmRiNTllM2U1MWExNi5jYW1lbEBz
aXBzb2x1dGlvbnMubmV0LwoKQW5kIGRyaXZlciBjb3VsZCBlbnN1cmUgdGhpcyBydWxlIGluIHNw
ZWMgYXMgSSBzYWlkIGJlZm9yZSBpbiBsaW5rIGJlbG93OgoiRm9yIE1MTywgaWYgUlNOQSBoYXMg
bm90IGJlZW4gZXN0YWJsaXNoZWQsIGVhY2ggbWVzc2FnZSBvZiB0aGUgNC13YXkKaGFuZHNoYWtl
IHNoYWxsIGJlIHNlbnQgb24gdGhlIHNhbWUgbGluayB1c2VkIGJ5IHRoZSBsYXRlc3QgZXhjaGFu
Z2Ugb2YKc3VjY2Vzc2Z1bCAoUmUpQXNzb2NpYXRpb24gUmVxdWVzdC9SZXNwb25zZSBmcmFtZXMu
IgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC13aXJlbGVzcy9iNjMxNGI2MS0wNzAwLTBl
MWMtN2IzOS0yMWMzMDVkYzI4YjNAcXVpY2luYy5jb20vCgpJdCB3aWxsIGJlIGNvbXBsZXh0IGZv
ciBkcml2ZXIvYXRoMTJrIHRvIHVzZSAKaWVlZTgwMjExX3NldF9hY3RpdmVfbGlua3MoL19hc3lu
YykuCj4KPj4gQEAgLTE2Niw2ICsxNjcsMTMgQEAgc3RhdGljIHZvaWQgaWVlZTgwMjExX3NldF92
aWZfbGlua3NfYml0bWFwcyhzdHJ1Y3QgaWVlZTgwMjExX3N1Yl9pZl9kYXRhICpzZGF0YSwKPj4g
ICAJCVdBUk5fT04oZG9ybWFudF9saW5rcyk7Cj4+ICAgCQlicmVhazsKPj4gICAJY2FzZSBOTDgw
MjExX0lGVFlQRV9TVEFUSU9OOgo+PiArCQlhY3RpdmVfbGlua3MgPSBkcnZfY2FsY3VsYXRlX2Fj
dGl2ZV9saW5rcyhzZGF0YS0+bG9jYWwsIHNkYXRhLAo+PiArCQkJCQkJCSAgdmFsaWRfbGlua3Mg
JiB+ZG9ybWFudF9saW5rcyk7Cj4+ICsJCWlmIChhY3RpdmVfbGlua3MpIHsKPj4gKwkJCXNkYXRh
LT52aWYuYWN0aXZlX2xpbmtzID0gYWN0aXZlX2xpbmtzOwo+PiArCQkJYnJlYWs7Cj4+ICsJCX0K
Pj4KPiBJIGFsc28gX3JlYWxseV8gZG9uJ3QgdGhpbmsgdGhpcyBzaG91bGQgb3BlcmF0ZSBhdCB0
aGlzIGxvdy1sZXZlbAo+IGluZnJhc3RydWN0dXJlLgoKSSByZWFsbHkgd2FudCB0byBrbm93IHRo
ZSByZWFzb24gd2h5IGFjdGl2ZSAqb25seSogdGhlIGFzc29jIGxpbmsgZm9yIApzdGF0aW9uLCBi
dXQKCmFjdGl2ZSAqYWxsKiBsaW5rcyBmb3IgQVAgaGVyZfCfmIE/Cgo+IGpvaGFubmVzCgotLSAK
YXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK

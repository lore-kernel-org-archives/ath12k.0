Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F488C43219
	for <ath12k@archiver.kernel.org>; Wed, 19 Oct 2022 09:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VlV+hTPwzWiOoic9cq0TUfUDs3rD5toc9TPuzustKQ=; b=13SRme7sNG1qs/
	i57HvBMNGKCWFReGJmJBiZCZ5XUYfXL6tYo3VmvI2Gdl+P5dyHq94Upyo0lRRTWWxbpacUXHi3n8P
	eFLLmJ5oB/8/jJswmuSyWZldqpgST/lLXPFwlQ5HffJsj7GdP7bIBNq2s1/CBtkQ8Ar4UR9P/t4Rv
	wIt3LSEuR1HhL+IcOVwV7noyC3C8OhFNY1b+PstOsR7Ido9yLNsuJ+at7uiKMTtwulTggjrDL9pfk
	pbkAOt4a3xVuTcKTPtRG0Y/zDSqz53a7mMhq+Vg6yzKfDxCKxbS3fU7ODzlVMvTtaGZzequARHYSe
	zWJA4DeIocrFwm5xDtXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5ZD-00HQtk-7y
	for ath12k@archiver.kernel.org; Wed, 19 Oct 2022 09:40:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5Yu-00HQhh-EB; Wed, 19 Oct 2022 09:40:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29J9ZI35009963;
	Wed, 19 Oct 2022 09:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bFpZcVHn4IvcPTJRMp+kub7pip4UrC6+M4EsMtCI4Dw=;
 b=H8ffm7EX//WlW7+26V0vwL6kJih14hd0tzwBKQJWVCNrC7RUHKdLIbtKBdIQrO7eyiR5
 KIayQKeAxt1nQBubUE2OaXiaULkBnegInAOXxHFIcTbWlwAjMfv+HLbBFlEzCj4d1B7z
 Kf7yt65fFiLcVfs6TvW8ShN5sp5zDf/K1TZnWDmBP7VL/d09wom9V+VQvVBmoalZi+a/
 Li+vy92hyk671x1sv622rnI8JDm3q7qOQ5JnLOLRr7x3sSuWFxuS4IbA9YpTooL26nAJ
 xzunGH7Kt8IOdbxxNNd9aDV47m/BpWZNPVjW8mGlpnQyUGEjO9JQ4bgJ31KMH0I4+OtU Pw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k9yq1j2qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 09:40:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29J9eTCn032409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 09:40:29 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 19 Oct
 2022 02:40:27 -0700
Message-ID: <1258a2cf-af82-3a58-a4b5-e0fcd961bf4b@quicinc.com>
Date: Wed, 19 Oct 2022 17:40:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: wifi: mac80211: Re: unicast probe response bssid changed by
 "wifi: mac80211: do link->MLD address translation on RX"
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
References: <e1c5fbac-7e6e-c643-f24d-32cec779f2d3@quicinc.com>
 <9fe7c0f2-e02f-e87f-dced-90e973c8992f@quicinc.com>
 <5f652efb43226f67e932f5aaf97cd717992bfd81.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <5f652efb43226f67e932f5aaf97cd717992bfd81.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: x4sE1l9eeT91MWxBBi-jFmVMow3aB8FE
X-Proofpoint-GUID: x4sE1l9eeT91MWxBBi-jFmVMow3aB8FE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_06,2022-10-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_024032_634872_50E75CAE 
X-CRM114-Status: GOOD (  19.37  )
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

T24gMTAvMTkvMjAyMiA1OjM4IFBNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+IE9uIFdlZCwgMjAy
Mi0xMC0xOSBhdCAxNzozNSArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4+IE9uIDkvMTQvMjAyMiAx
MToxMyBBTSwgV2VuIEdvbmcgd3JvdGU6Cj4+PiBIaSBKb2hhbm5lcywKPj4+Cj4+PiBUaGUgbWFj
IGFkZHIgb2YgdW5pY2FzdCByeCBwYWNrZXQgYWxsIGNoYW5nZWQgdG8gdGhlIE1MRCBhZGRyZXNz
IGJ5Cj4+PiBiZWxvdyBwYXRjaC4KPj4+IE5vdyB0aGUgcHJvYmUgcHJlc3BvbnNlIHdoaWNoIGlz
IHVuaWNhc3QgcGFja2V0IGlzIGFsc28gY2hhbmdlZCBtYWMKPj4+IGFkZHJlc3MgaGVyZS4KPj4+
IEkgZm91bmQgYnNzaWQgd2hpY2ggaXMgdGhlIE1MRCBhZGRyZXNzIG9mIG15IHRlc3QgQVAgaW4K
Pj4+IGNmZzgwMjExX2dldF9ic3MoKS4KPj4+IEZvciBleGFtcGxlLCBpZiB0aGUgQVAgaGFzIDIg
bWxvIGxpbmtzLCBsaW5rIDEgaXMgNSBHSHogYmFuZCwgbGluayAyCj4+PiBpcyAyLjQgR0h6IGJh
bmQsCj4+PiB0aGVuIHRoZSAyIHByb2JlIHJlcG9uc2Ugd2lsbCBiZSBjaGFuZ2VkIHRvIGEgc2Ft
ZSBvbmUuCj4+PiBzZWVtcyB3ZSBzaG91bGQgc2tpcCBwcm9iZSBwcmVzcG9uc2UgZm9yIHRoZSBt
YWMgYWRkcmVzcyBjaGFuZ2UgaGVyZSwKPj4+IHJpZ2h0Pwo+Pj4KPj4+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2t2YWxvL2F0aC5naXQvY29tbWl0Lz9p
ZD00MmZiOTE0OGMwNzgwMDRkMDdiNGMzOWJkN2IxMDg2YjYxNjU3ODBjCj4+Pgo+Pj4gd2lmaTog
bWFjODAyMTE6IGRvIGxpbmstPk1MRCBhZGRyZXNzIHRyYW5zbGF0aW9uIG9uIFJYCj4+Pgo+PiBI
aSBKb2hhbm5lcywKPj4KPj4gTWF5IEkgZ2V0IHlvdXIgY29tbWVudCBhYm91dCB0aGlzPwo+IFll
cyBJJ3ZlIGFjdHVhbGx5IHNlZW4gdGhpcyBpc3N1ZSBhcyB3ZWxsLgo+Cj4+IEkgZGlkIGJlbG93
IGNoYW5nZSBpbiBteSBsb2NhbCB0ZXN0IHRvIHdvcmthcm91bmQgdGhlIGlzc3VlLgo+Pgo+PiBk
aWZmIC0tZ2l0IGEvbmV0L21hYzgwMjExL3J4LmMgYi9uZXQvbWFjODAyMTEvcnguYwo+PiBpbmRl
eCBhNTc4MTEzNzIwMjcuLmVhZmY1MzUzNTIwYSAxMDA2NDQKPj4gLS0tIGEvbmV0L21hYzgwMjEx
L3J4LmMKPj4gKysrIGIvbmV0L21hYzgwMjExL3J4LmMKPj4gQEAgLTQ4NTgsNyArNDg1OCw4IEBA
IHN0YXRpYyBib29sIGllZWU4MDIxMV9wcmVwYXJlX2FuZF9yeF9oYW5kbGUoc3RydWN0Cj4+IGll
ZWU4MDIxMV9yeF9kYXRhICpyeCwKPj4gICDCoMKgwqDCoCDCoMKgwqAgc2h3dC0+aHd0c3RhbXAg
PSBza2JfaHd0c3RhbXBzKHNrYiktPmh3dHN0YW1wOwo+PiAgIMKgwqDCoMKgIH0KPj4KPj4gLcKg
wqDCoCBpZiAodW5saWtlbHkobGlua19zdGEpKSB7Cj4+ICvCoMKgwqAgaWYgKHVubGlrZWx5KGxp
bmtfc3RhKSAmJgo+PiArwqDCoMKgIMKgwqDCoCAhKGllZWU4MDIxMV9pc19wcm9iZV9yZXNwKGhk
ci0+ZnJhbWVfY29udHJvbCkpKSB7Cj4+ICAgwqDCoMKgwqAgwqDCoMKgIC8qIHRyYW5zbGF0ZSB0
byBNTEQgYWRkcmVzc2VzICovCj4+Cj4gTWF5YmUgaXQgc2hvdWxkIGFsc28gYmUgZm9yIGJlYWNv
bnMgb3Igc28/Cj4KPiBqb2hhbm5lcwpZZXMsIGl0IHNob3VsZCBhbHNvIGZvciBiZWFjb25zLgoK
LS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cHM6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==

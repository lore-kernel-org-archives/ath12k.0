Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777F4C00528
	for <ath12k@archiver.kernel.org>; Thu,  3 Aug 2023 11:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OyNiuohSytxXYRFJqfrr8V8tCfyipac09D3NTeCmnmo=; b=zFzDkIStbsGJoR
	OevcQYfmPiQsSa7QK26k2DC+Jkd56vW+LtljBQ9faRENo0ZlRP9mGPZdz4y/ei5TxCVutCvqO6Kbc
	9PIMBbZAc04LEP9ZkW2kxS4O6D5nvsqpf1+ZJoQFsFnWHXm9XkIZjCd/7tVidhRJcGZLxFtCNJWVF
	DJriZhZ95V2j5VbVXY4Zah7+fYyh+/NsgsOaiG7G1yRY7YxhKJZZoMSv7i/BPDG2DqBTzA7KtFc8r
	Fvzd03xqILhjucrI8MuG84MBFk6fWDElLOEpRVVCy+0PdUuuYYcyNNDC0zbgEI1ZQTblhHzH24pal
	lelSsOeuvNMbLU4KPZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRWMN-007jVY-06
	for ath12k@archiver.kernel.org;
	Thu, 03 Aug 2023 11:19:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRWMK-007jSP-2V
	for ath12k@lists.infradead.org;
	Thu, 03 Aug 2023 11:19:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3739KAM1015034;
	Thu, 3 Aug 2023 11:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8mz2ihCaUMzYESp5GUdiI/VzVrVVh1vnt+863SOsE+o=;
 b=p5RgS63EEwcdlCf+m4FDhsZzO5WBVFLiLW6Mqz5iiN/ust+sySq1JH3XnAqVuWq0QwjN
 crWbwZc34GtTzmAShEH/pPBvoRZYKg7l+ama7doXnK1eyn4qapnyxdcwuWQHqhX/8lU0
 7pAXtKdoKKqUvlXCs1aFkw2mT/qrIETZ3Rl5Hkhpn0kCFYiB7/xVizfmTPEoZ6uhInhd
 8ffJzaXABAwuRGTjHy9l7IpucUG2RAB5lD1TEo/EZe5X5hc8Tj/T53kVodhCzh+iJ6Xn
 wLomH0/elNX/BlJMNgKxc4U/pH9v2mbzk+ajtxME1g68BJ+mzuFlEURa41q6GeZJP1mm pg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7upp1qjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Aug 2023 11:19:07 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 373BJ6Mg021183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Aug 2023 11:19:06 GMT
Received: from [10.201.204.39] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 3 Aug
 2023 04:19:05 -0700
Message-ID: <97ad035b-61b5-fbcf-ba81-aadbe7a0b7c4@quicinc.com>
Date: Thu, 3 Aug 2023 16:49:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: fix WARN_ON during
 ath12k_mac_update_vif_chan
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230802085852.19821-1-quic_mdharane@quicinc.com>
 <20230802085852.19821-2-quic_mdharane@quicinc.com>
 <54733de9-db66-f1c4-9ad5-4d1f31529c05@quicinc.com>
From: Manish Dharanenthiran <quic_mdharane@quicinc.com>
In-Reply-To: <54733de9-db66-f1c4-9ad5-4d1f31529c05@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WZElMT0PaPHcMc7Basak0UMAVKyfLhxF
X-Proofpoint-ORIG-GUID: WZElMT0PaPHcMc7Basak0UMAVKyfLhxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_09,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=932 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308030101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_041912_965054_0F44A52C 
X-CRM114-Status: GOOD (  20.66  )
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

CgpPbiA4LzIvMjAyMyA4OjI5IFBNLCBKZWZmIEpvaG5zb24gd3JvdGU6Cj4gT24gOC8yLzIwMjMg
MTo1OCBBTSwgTWFuaXNoIERoYXJhbmVudGhpcmFuIHdyb3RlOgo+PiBGaXggV0FSTl9PTigpIGZy
b20gYXRoMTJrX21hY191cGRhdGVfdmlmX2NoYW4oKSBpZiB2ZGV2IGlzIG5vdCB1cC4KPj4gU2lu
Y2UgY2hhbmdlX2NoYW5jdHggY2FuIGJlIGNhbGxlZCBldmVuIGJlZm9yZSB2ZGV2X3VwLgo+Pgo+
PiBEbyB2ZGV2IHN0b3AgZm9sbG93ZWQgYnkgYSB2ZGV2IHN0YXJ0IGluIGNhc2Ugb2YgdmRldiBp
cyBkb3duLgo+Pgo+PiBUZXN0ZWQtb246IFFDTjkyNzQgaHcyLjAgUENJIFdMQU4uV0JFLjEuMC0w
MjkwMy1RQ0FIS1NXUExfU0lMSUNPTlotMQo+IAo+IEhhcyB0aGlzIGJlZW4gdGVzdGVkIG9uIFdD
Tjc4NTA/IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBmaXJtd2FyZSBtYXkgCj4gZXhwZWN0IHZk
ZXYgZG93biBhbmQgdGhlbiB2ZGV2IHJlc3RhcnQKSGkgSmVmZiwKCk5vLCBub3QgdGVzdGVkIHdp
dGggV0NONzg1MCBjaGlwLXNldC4gQnV0LCB3ZSB3aWxsIGJlIHNlbmRpbmcgdmRldl9kb3duIApi
ZWZvcmUgc3RhcnRpbmcgdGhlIHJlc3RhcnQgc2VxdWVuY2UuIExldCBtZSBnZXQgaGVscCBmcm9t
IE1DQyB0ZWFtIHRvIAp0ZXN0IHRoaXMgcGF0Y2ggYW5kIHVwZGF0ZSB0aGUgY2hhbmdlcywgaWYg
bmVlZGVkLgo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYW5pc2ggRGhhcmFuZW50aGlyYW4gPHF1
aWNfbWRoYXJhbmVAcXVpY2luYy5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTJrL21hYy5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9tYWMuYyAKPj4gYi9k
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL21hYy5jCj4+IGluZGV4IDFiYjk4MDJlZjU2
OS4uMGFiOTVlMTM4ZDFkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTJrL21hYy5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMmsvbWFj
LmMKPj4gQEAgLTU2OTgsMTMgKzU2OTgsMjggQEAgYXRoMTJrX21hY191cGRhdGVfdmlmX2NoYW4o
c3RydWN0IGF0aDEyayAqYXIsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoV0FSTl9PTighYXJ2
aWYtPmlzX3N0YXJ0ZWQpKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsK
Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChXQVJOX09OKCFhcnZpZi0+aXNfdXApKQo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4gK8KgwqDCoMKgwqDCoMKgIC8qIEZpcm13YXJl
IGV4cGVjdCB2ZGV2X3Jlc3RhcnQgb25seSBpZiB2ZGV2IGlzIHVwLgo+PiArwqDCoMKgwqDCoMKg
wqDCoCAqIElmIHZkZXYgaXMgZG93biB0aGVuIGl0IGV4cGVjdCB2ZGV2X3N0b3AtPnZkZXZfc3Rh
cnQuCj4+ICvCoMKgwqDCoMKgwqDCoMKgICovCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoYXJ2aWYt
PmlzX3VwKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGF0aDEya19tYWNfdmRl
dl9yZXN0YXJ0KGFydmlmLCAmdmlmc1tpXS5uZXdfY3R4LT5kZWYpOwo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAocmV0KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YXRoMTJrX3dhcm4oYWIsICJmYWlsZWQgdG8gcmVzdGFydCB2ZGV2ICVkOiAlZFxuIiwKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXJ2aWYtPnZkZXZf
aWQsIHJldCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gK8KgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGF0aDEya19tYWNfdmRldl9zdG9wKGFydmlm
KTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkgewo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGF0aDEya193YXJuKGFiLCAiZmFpbGVkIHRvIHN0b3AgdmRldiAl
ZDogJWRcbiIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGFydmlmLT52ZGV2X2lkLCByZXQpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnRpbnVlOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IC3CoMKgwqDCoMKg
wqDCoCByZXQgPSBhdGgxMmtfbWFjX3ZkZXZfcmVzdGFydChhcnZpZiwgJnZpZnNbaV0ubmV3X2N0
eC0+ZGVmKTsKPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChyZXQpIHsKPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYXRoMTJrX3dhcm4oYWIsICJmYWlsZWQgdG8gcmVzdGFydCB2ZGV2ICVkOiAlZFxu
IiwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFydmlmLT52ZGV2
X2lkLCByZXQpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBhdGgxMmtfbWFjX3Zk
ZXZfc3RhcnQoYXJ2aWYsICZ2aWZzW2ldLm5ld19jdHgtPmRlZik7Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXRo
MTJrX3dhcm4oYWIsICJmYWlsZWQgdG8gc3RhcnQgdmRldiAlZDogJWRcbiIsCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFydmlmLT52ZGV2X2lkLCBy
ZXQpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIH0KPiAKCi0tIAphdGgxMmsgbWFpbGluZyBsaXN0CmF0aDEya0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDEyawo=

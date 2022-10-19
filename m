Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A9CC4332F
	for <ath12k@archiver.kernel.org>; Wed, 19 Oct 2022 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PoHAgGnQbv78SGjzM82S59xoE5fjPAKAwOvnPIU8SN0=; b=T52SSNdyv8+9b0
	K0LKhj2orF0xRO+vYYwxO9EHQacmlwrRPm5k25HIO/8m+1muyPlOJo+OFUj1r6fQYfU+FiseS1k6G
	Gr1R/Gm6KgVdM5zxSI7hqtI0OC+ODzIdK2OH69Bxs4gFDrcaTk4CqjrXJSXailLsEFHfsq3lOxZZj
	nUAwDResVGGMFmYhdVyg0RRC+JS6RLyCJGSmOkPCRO2eBcr5gEjpRPwr4j5Pqw+rmW7qQYOU+xrMc
	fGZjmogzbBLmnnx63rhKnKZ6lz7TQsDcJTxEs2uBOBGzUSFuxUlTpAlasQTnQl2pph6E3yVmwYYX3
	3AJUexEhvwlSpq+ERtiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5Uh-00HOWW-NG
	for ath12k@archiver.kernel.org; Wed, 19 Oct 2022 09:36:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5UW-00HORY-Vo; Wed, 19 Oct 2022 09:36:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29J9CR79030520;
	Wed, 19 Oct 2022 09:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=N4XbolfPRYP6yQS3rO7PdXpeLrCTZh1nx3CX/lYi56E=;
 b=GpIJWE3MLDHRl12ADGK9hyT275NToi8bvKU2ccktXKcnpT6+DgTivOYK9ITS4bXTUSxW
 JKBm9p+hR7p3EJPwSp1SErKHk0XbFsZAB0TlnniL9JstiH50YPW2dJpQDjYc0he4AjvI
 xqvvCec75stNFJrf8zGP5iAnUrC7KznoHqDkM03iWJLwku7l0bz52Rhmpjrcd4kBV3e7
 p6GaqyhaE6eRxuzmHzPyALC2QNSMiq3y3F3WszjF7SVdkK773+YQMKMGFYBxxgxzyR+M
 vUecUSQ/VgGEOdwuMbOXKwNZw0xVhUCWlE/GJ0TYdigPXZzwmZbvpZcfmbQpYgpQrOJn 5w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kaed8r4ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 09:35:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29J9ZtJL019075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 09:35:55 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 19 Oct
 2022 02:35:53 -0700
Message-ID: <9fe7c0f2-e02f-e87f-dced-90e973c8992f@quicinc.com>
Date: Wed, 19 Oct 2022 17:35:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: wifi: mac80211: Re: unicast probe response bssid changed by "wifi:
 mac80211: do link->MLD address translation on RX"
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
References: <e1c5fbac-7e6e-c643-f24d-32cec779f2d3@quicinc.com>
In-Reply-To: <e1c5fbac-7e6e-c643-f24d-32cec779f2d3@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BR9fgVrzolWHlHCFTY3NnqECkUqnFIDI
X-Proofpoint-GUID: BR9fgVrzolWHlHCFTY3NnqECkUqnFIDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_06,2022-10-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 mlxlogscore=912 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_023601_104581_202F1E04 
X-CRM114-Status: GOOD (  17.88  )
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

T24gOS8xNC8yMDIyIDExOjEzIEFNLCBXZW4gR29uZyB3cm90ZToKPiBIaSBKb2hhbm5lcywKPgo+
IFRoZSBtYWMgYWRkciBvZiB1bmljYXN0IHJ4IHBhY2tldCBhbGwgY2hhbmdlZCB0byB0aGUgTUxE
IGFkZHJlc3MgYnkgCj4gYmVsb3cgcGF0Y2guCj4gTm93IHRoZSBwcm9iZSBwcmVzcG9uc2Ugd2hp
Y2ggaXMgdW5pY2FzdCBwYWNrZXQgaXMgYWxzbyBjaGFuZ2VkIG1hYyAKPiBhZGRyZXNzIGhlcmUu
Cj4gSSBmb3VuZCBic3NpZCB3aGljaCBpcyB0aGUgTUxEIGFkZHJlc3Mgb2YgbXkgdGVzdCBBUCBp
biAKPiBjZmc4MDIxMV9nZXRfYnNzKCkuCj4gRm9yIGV4YW1wbGUsIGlmIHRoZSBBUCBoYXMgMiBt
bG8gbGlua3MsIGxpbmsgMSBpcyA1IEdIeiBiYW5kLCBsaW5rIDIgCj4gaXMgMi40IEdIeiBiYW5k
LAo+IHRoZW4gdGhlIDIgcHJvYmUgcmVwb25zZSB3aWxsIGJlIGNoYW5nZWQgdG8gYSBzYW1lIG9u
ZS4KPiBzZWVtcyB3ZSBzaG91bGQgc2tpcCBwcm9iZSBwcmVzcG9uc2UgZm9yIHRoZSBtYWMgYWRk
cmVzcyBjaGFuZ2UgaGVyZSwgCj4gcmlnaHQ/Cj4KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9rdmFsby9hdGguZ2l0L2NvbW1pdC8/aWQ9NDJmYjkxNDhj
MDc4MDA0ZDA3YjRjMzliZDdiMTA4NmI2MTY1NzgwYyAKPgo+IHdpZmk6IG1hYzgwMjExOiBkbyBs
aW5rLT5NTEQgYWRkcmVzcyB0cmFuc2xhdGlvbiBvbiBSWAo+CkhpIEpvaGFubmVzLAoKTWF5IEkg
Z2V0IHlvdXIgY29tbWVudCBhYm91dCB0aGlzPwoKSSBkaWQgYmVsb3cgY2hhbmdlIGluIG15IGxv
Y2FsIHRlc3QgdG8gd29ya2Fyb3VuZCB0aGUgaXNzdWUuCgpkaWZmIC0tZ2l0IGEvbmV0L21hYzgw
MjExL3J4LmMgYi9uZXQvbWFjODAyMTEvcnguYwppbmRleCBhNTc4MTEzNzIwMjcuLmVhZmY1MzUz
NTIwYSAxMDA2NDQKLS0tIGEvbmV0L21hYzgwMjExL3J4LmMKKysrIGIvbmV0L21hYzgwMjExL3J4
LmMKQEAgLTQ4NTgsNyArNDg1OCw4IEBAIHN0YXRpYyBib29sIGllZWU4MDIxMV9wcmVwYXJlX2Fu
ZF9yeF9oYW5kbGUoc3RydWN0IAppZWVlODAyMTFfcnhfZGF0YSAqcngsCiDCoMKgwqDCoCDCoMKg
wqAgc2h3dC0+aHd0c3RhbXAgPSBza2JfaHd0c3RhbXBzKHNrYiktPmh3dHN0YW1wOwogwqDCoMKg
wqAgfQoKLcKgwqDCoCBpZiAodW5saWtlbHkobGlua19zdGEpKSB7CivCoMKgwqAgaWYgKHVubGlr
ZWx5KGxpbmtfc3RhKSAmJgorwqDCoMKgIMKgwqDCoCAhKGllZWU4MDIxMV9pc19wcm9iZV9yZXNw
KGhkci0+ZnJhbWVfY29udHJvbCkpKSB7CiDCoMKgwqDCoCDCoMKgwqAgLyogdHJhbnNsYXRlIHRv
IE1MRCBhZGRyZXNzZXMgKi8KIMKgwqDCoMKgIMKgwqDCoCBpZiAoZXRoZXJfYWRkcl9lcXVhbChs
aW5rLT5jb25mLT5hZGRyLCBoZHItPmFkZHIxKSkKIMKgwqDCoMKgIMKgwqDCoCDCoMKgwqAgZXRo
ZXJfYWRkcl9jb3B5KGhkci0+YWRkcjEsIHJ4LT5zZGF0YS0+dmlmLmFkZHIpOwoKCi0tIAphdGgx
MmsgbWFpbGluZyBsaXN0CmF0aDEya0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHBzOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEyawo=

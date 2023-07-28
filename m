Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA080C001DC
	for <ath12k@archiver.kernel.org>; Fri, 28 Jul 2023 02:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m22SAfUXTknyy/HayINhjuLQZTsIB8bDRqQw10/dVfI=; b=vnvWgQ8v4npXnS
	ta4u7WHjzS6N54WzDHyWFzaZlRiqBGwO7cDUrqkP2dJxIYbHicNvDUq4uDtaSxeWD2cE0WLlYcfc0
	Hf+EX2hidQxgfvwkAPCDUE98oweSIDqRgYWJzsLglQ+7XQhELhnpOwnOFsA3ZccY2IIdaS1BVori2
	urBzBUi8JGtZXEDa/CG/lCHO9PPT3QJ4guGHUqn5HUM3ZRABGLtKZ2aaFPQQcUhGRzR/5nD9mLy6z
	OeyqmLlN3llDnENx2pbqXQVHg2tNH8eEg36Oz/CJmMH9qPLptFoxcMpIFzOV65XWfch4MWDGUSgje
	5fmZVskbmAFUvRDEK/1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPDYc-001LmU-1j
	for ath12k@archiver.kernel.org;
	Fri, 28 Jul 2023 02:50:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPDYY-001LlN-0l
	for ath12k@lists.infradead.org;
	Fri, 28 Jul 2023 02:50:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36S2YHEn008385;
	Fri, 28 Jul 2023 02:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=S/ezvRekaPKOSQwBMKmteFRdglAZupaMj9eDIie4AiM=;
 b=n6o0tmh8hOWAcPN8i3yu7w+/q474MFeS3n3Y15I4g+0OQG/htS7xJHEnuu62F3zyep/Q
 rA/Y2RY0jqIt7nSEpm7+FS5lpopyZcw818cYcQkjyonZZWclbq/uMHN+4YvgCnorqHgo
 6gM0nl74SHVxWDn9OX1EmiMZFiOg4HuDr8SQ6P81R2S6tYwWm4E55jxbcH/qBncU87zQ
 yiQ/uFIsojVjcrB3uad9FpsrjPyeEtkzL7HXCBt6HuTNZAAQyFni+3v4ZAFNTkUv+Tsf
 ee8IWj9TTnBuofXDGq48VNt1zMBitcDJrlagwvfYr+kAY3WG/hkHooUYoUug4rBTtKsE 9Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s3f582vum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 02:50:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36S2oEAg024677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 02:50:14 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 19:50:13 -0700
Message-ID: <7f15df67-c3df-0315-0ee7-07158860de63@quicinc.com>
Date: Fri, 28 Jul 2023 10:50:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 06/11] wifi: ath12k: prepare EHT peer assoc parameters
Content-Language: en-US
To: Aloka Dixit <quic_alokad@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
CC: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
References: <20230725224034.14045-1-quic_alokad@quicinc.com>
 <20230725224034.14045-7-quic_alokad@quicinc.com>
 <293dd873-1d9d-afc0-a122-48dfe4bb0fde@quicinc.com>
 <333fd74a-4178-3cef-5748-62a14ba2da5a@quicinc.com>
 <47396ec0-a0b3-8275-b29d-9ed72a9922cf@quicinc.com>
 <eac30246-1360-2854-3f53-28bdf5a24e24@quicinc.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <eac30246-1360-2854-3f53-28bdf5a24e24@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PjmArUkY_U154yPAvWuJnwkH1H0rDYYi
X-Proofpoint-ORIG-GUID: PjmArUkY_U154yPAvWuJnwkH1H0rDYYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_195018_280375_C34186CC 
X-CRM114-Status: GOOD (  21.67  )
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

T24gNy8yOC8yMDIzIDEyOjU5IEFNLCBBbG9rYSBEaXhpdCB3cm90ZToKPiBPbiA3LzI2LzIwMjMg
MTA6NDggUE0sIFdlbiBHb25nIHdyb3RlOgo+PiBPbiA3LzI3LzIwMjMgMTI6MzggQU0sIEFsb2th
IERpeGl0IHdyb3RlOgo+Pj4gT24gNy8yNS8yMDIzIDg6NDMgUE0sIFdlbiBHb25nIHdyb3RlOgo+
Pj4+IE9uIDcvMjYvMjAyMyA2OjQwIEFNLCBBbG9rYSBEaXhpdCB3cm90ZToKPj4+PiBbLi4uXQo+
Pj4+PiArCj4+Pj4+ICtzdGF0aWMgdm9pZCBhdGgxMmtfcGVlcl9hc3NvY19oX2VodChzdHJ1Y3Qg
YXRoMTJrICphciwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBpZWVlODAyMTFfdmlmICp2aWYsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaWVlZTgwMjExX3N0YSAqc3RhLAo+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGF0aDEya193bWlfcGVlcl9h
c3NvY19hcmcgKmFyZykKPj4+Pj4gK3sKPj4+Pj4gKwo+Pj4+IFRoaXMgaXMgdGhlIElFcyBvZiBt
eSBBUCBiZWxvdywgdGhlbiBpdCB3aWxsIHN0aWxsIGVudGVyZWQgaW50byAKPj4+PiB0aGlzIGJy
YW5jaCBmb3IgbXkgYXRoMTJrIHN0YXRpb24gbW9kZS4KPj4+PiBzdGEtPmRlZmxpbmsuZWh0X2Nh
cCBhbmQgc3RhLT5kZWZsaW5rLmhlX2NhcCBpcyBjb3BpZWQgZnJvbSBwZWVyIAo+Pj4+IHJlbW90
ZSwgZm9yIGF0aDEyayBzdGF0aW9uIG1vZGUsIHBlZXIKPj4+PiByZW1vdGUgaXMgdGhlIEFQLiBU
aGUgZmllbGQgb25seV8yMG1oeiBpcyBvbmx5IHZhbGlkIHdoZW4gdGhlIElFcyAKPj4+PiBpcyBm
cm9tIGEgc3RhdGlvbiB3aGljaCBvbmx5IHN1cHBvcnQKPj4+PiAyMCBNSHouCj4+Pj4KPj4+PiBJ
IHRoaW5rIHRoZSBmbGFnIGZyb21fYXAgc2hvdWxkIGJlIGFkZGVkIGhlcmUgYXMgd2VsbCBhcyBm
dW5jdGlvbiAKPj4+PiBpZWVlODAyMTFfZWh0X21jc19uc3Nfc2l6ZSgpLgo+Pj4+Cj4+Pj4gUGxl
YXNlIGNvcnJlY3QgbWUgaWYgd3JvbmcuCj4+Pj4KPj4+Cj4+PiBPa2F5LCBjYW4geW91IGZpeCB0
aGlzIGluIGEgZm9sbG93LXVwIHBhdGNoPwo+Pj4gSSBkb24ndCBoYXZlIGEgZGV2aWNlIHRvIHRl
c3QgdGhlIHN0YXRpb24gbW9kZSB0byB2ZXJpZnkgYSBmaXguCj4+PiBUaGFua3MuCj4+IFRoZSBm
aXggcGF0Y2ggaXMgc2ltcGxlIGxpa2UgdGhpcyAoSSBoYXZlIHZlcmlmaWVkIE9LKSwgeW91IGNh
biBtZXJnZSAKPj4gaXQgdG8geW91ciBwYXRjaC7wn5iBCj4+Cj4+IEl0IGlzIHRvIG5vdCB1c2Ug
b25seV8yMG1oeiB3aGVuIGF0aDEyayBpcyBzdGF0aW9uIG1vZGUuCj4+Cj4KPiBUaGFua3MgV2Vu
Lgo+Cj4gSXQgd291bGQgYmUgc2ltcGxlciBpZiB0aGUgY3VycmVudCB2ZXJzaW9uLCB3aGljaCB3
b3JrcyBmb3IgdGhlIAo+IG1ham9yaXR5IG9mIGNhc2VzIGZvciBib3RoIEFQIGFuZCBub24tQVAg
U1RBIG1vZGUsIGdldHMgcmV2aWV3ZWQgZmlyc3QgCj4gY29uc2lkZXJpbmcgMTAvMTEgcGF0Y2hl
cyB3aWxsIHJlbWFpbiBzYW1lIGZvciB0aGUgbmV4dCB2ZXJzaW9uLgo+IEV2ZXJ5IHRpbWUgSSBy
ZS1iYXNlIHRoZSBzZXJpZXMgSSBoYXZlIHRvIHRlc3QsIGFkZCBjb3Zlci1sZXR0ZXIsIAo+IGNo
YW5nZS1sb2cgaW4gMTEgcGF0Y2hlcy4gU2VlbXMgbGlrZSBhbiBvdmVya2lsbCBmb3IgYSBub24t
Y3Jhc2ggCj4gcmVsYXRlZCBmaXggd2hpY2ggY2FuIGJlIHJldmlld2VkIHNlcGFyYXRlbHkuCj4K
PiBMZXQncyBzZWUgd2hhdCBLYWxsZSB0aGlua3MuCgpUaGUgY2hhbmdlIGlzIHNpbXBsZSBoZXJl
LCBhbmQgSSBoYXZlIHZlcmlmaWVkIG9uIFdDTjc4NTAgc3RhdGlvbiBtb2RlIApzdWNjZXNzZnVs
bHkuCgpJIHRoaW5rIHlvdSBkbyBub3QgbmVlZCByZS1iYXNlIGFuZCByZS10ZXN08J+YgQoKQW55
d2F5LCBsZXQncyBzZWUgd2hhdCBLYWxsZSB0aGlua3MuCgpAIC0yNDgyLDYgKzI0ODIsNyBAQCBz
dGF0aWMgdm9pZCBhdGgxMmtfcGVlcl9hc3NvY19oX2VodChzdHJ1Y3QgYXRoMTJrICphciwKIMKg
wqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBpZWVlODAyMTFfZWh0X21jc19uc3Nfc3VwcF9idyAq
bWNzX25zc19zdXBwX2J3OwogwqDCoMKgwqDCoMKgwqAgdTggbWNzX2lkeCA9IFdNSV9FSFRDQVBf
VFhSWF9NQ1NfTlNTX0lEWF84MDsKK8KgwqDCoMKgwqDCoCBib29sIGlzX2xvY2FsX3N0YSA9IGFy
dmlmLT52aWYtPnR5cGUgPT0gTkw4MDIxMV9JRlRZUEVfU1RBVElPTjsKCiDCoMKgwqDCoMKgwqDC
oCBlaHRfY2FwID0gJnN0YS0+bGlua1tsaW5rX2lkXS0+ZWh0X2NhcDsKCkBAIC0yNTIyLDcgKzI1
MjMsNyBAQCBzdGF0aWMgdm9pZCBhdGgxMmtfcGVlcl9hc3NvY19oX2VodChzdHJ1Y3QgYXRoMTJr
IAoqYXIsCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmFsbHRocm91Z2g7CgogwqDC
oMKgwqDCoMKgwqAgZGVmYXVsdDoKLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCho
ZV9jYXAtPmhlX2NhcF9lbGVtLnBoeV9jYXBfaW5mb1swXSAmCivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmICghaXNfbG9jYWxfc3RhICYmIAooaGVfY2FwLT5oZV9jYXBfZWxlbS5waHlf
Y2FwX2luZm9bMF0gJikgewoKCi0tIAphdGgxMmsgbWFpbGluZyBsaXN0CmF0aDEya0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDEyawo=

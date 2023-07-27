Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B576EB64DD
	for <ath12k@archiver.kernel.org>; Thu, 27 Jul 2023 05:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P4W9+HGFAT39HCQe1+2exhdLqrlO4UPnKw0Q/5T30vg=; b=VBTFuGlbd87Xbq
	EiVVcYtr1GJBhHVqVU3wErKhreQNbLvnE/0zGS+ZRxbPJufjBCX78qUXejl2SOTRH+KDjeKIq7Y0u
	qK2fzy+JXvH3Ij0BTytuVoHH3nzs1jEMzc0l/UzUtYEZPMN8IERQd8+QsUaWIeaA+2NEjPDdU2aiY
	z8qbPJKsRTNzqhXw7+WNfh2lFQI5mpZmXGMrJPMbdgiGgbTIH4uNdbCi7Ui6nDyGCTkLo0FTnfAgS
	fbbMeWD5/IqviOepf8UjoRcjuj+x1etifSMAcAhMaMwKR36+Pp5bYOVgdN8h+DMdWFAgkmPn+Q49a
	3NgyuCRb+YizvC0ItadA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOtrz-00CF6w-15
	for ath12k@archiver.kernel.org;
	Thu, 27 Jul 2023 05:49:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOtrw-00CF6D-0g
	for ath12k@lists.infradead.org;
	Thu, 27 Jul 2023 05:49:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R5mwDj010553;
	Thu, 27 Jul 2023 05:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nhSV/2lSQlm97z9CYvuNkSeotN9QKOjzTSlPjc5xu6g=;
 b=prenUwAqQlbue69x2WBnzg9iWVTHB4RySL98SGcgxkggC7GqhcIRO1i/i+ZthFvlCSkE
 hn1m978toDBob6zshR7aCBRX8AQvwT/Jqi3WdJRsaHoJ5Rol1cP9KjvYt0MQ8IOyJqLP
 LkIjs8W2uwTyiAZvlkcTyA3Zn2nETw26NwymvRUJsCzMrLg95gt2GKJRQSpXT03M0kYk
 5FCw7MVxtbesSF3JlALzAyukcrSnOzSG/d+YD5AoNegx1hyRhB+aUGt9h5D9Kp4ArT6E
 KfDLZjKOJzMUcesXOsePn50Bv4uFv0k23MYqwMSbfkSHihc/sFkSw/fbKfeW8QiH8bTd Bw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s34x6hkc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 05:48:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36R5mvXv022519
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 05:48:57 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 26 Jul
 2023 22:48:55 -0700
Message-ID: <47396ec0-a0b3-8275-b29d-9ed72a9922cf@quicinc.com>
Date: Thu, 27 Jul 2023 13:48:53 +0800
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
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <333fd74a-4178-3cef-5748-62a14ba2da5a@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ikWfK0cI9OF7GgSARAahlnOv-oAsLH3C
X-Proofpoint-ORIG-GUID: ikWfK0cI9OF7GgSARAahlnOv-oAsLH3C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_224900_254998_F5C55E14 
X-CRM114-Status: GOOD (  21.03  )
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

T24gNy8yNy8yMDIzIDEyOjM4IEFNLCBBbG9rYSBEaXhpdCB3cm90ZToKPiBPbiA3LzI1LzIwMjMg
ODo0MyBQTSwgV2VuIEdvbmcgd3JvdGU6Cj4+IE9uIDcvMjYvMjAyMyA2OjQwIEFNLCBBbG9rYSBE
aXhpdCB3cm90ZToKPj4gWy4uLl0KPj4+ICsKPj4+ICtzdGF0aWMgdm9pZCBhdGgxMmtfcGVlcl9h
c3NvY19oX2VodChzdHJ1Y3QgYXRoMTJrICphciwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaWVlZTgwMjExX3ZpZiAqdmlmLAo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpZWVlODAyMTFfc3RhICpzdGEs
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGF0aDEy
a193bWlfcGVlcl9hc3NvY19hcmcgKmFyZykKPj4+ICt7Cj4+PiArwqDCoMKgIGNvbnN0IHN0cnVj
dCBpZWVlODAyMTFfc3RhX2VodF9jYXAgKmVodF9jYXAgPSAKPj4+ICZzdGEtPmRlZmxpbmsuZWh0
X2NhcDsKPj4+ICvCoMKgwqAgY29uc3Qgc3RydWN0IGllZWU4MDIxMV9zdGFfaGVfY2FwICpoZV9j
YXAgPSAmc3RhLT5kZWZsaW5rLmhlX2NhcDsKPj4gWy4uLl0KPj4+ICvCoMKgwqAgZGVmYXVsdDoK
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoKGhlX2NhcC0+aGVfY2FwX2VsZW0ucGh5X2NhcF9pbmZv
WzBdICYKPj4+ICsgKElFRUU4MDIxMV9IRV9QSFlfQ0FQMF9DSEFOTkVMX1dJRFRIX1NFVF80ME1I
Wl9JTl8yRyB8Cj4+PiArIElFRUU4MDIxMV9IRV9QSFlfQ0FQMF9DSEFOTkVMX1dJRFRIX1NFVF80
ME1IWl84ME1IWl9JTl81RyB8Cj4+PiArIElFRUU4MDIxMV9IRV9QSFlfQ0FQMF9DSEFOTkVMX1dJ
RFRIX1NFVF8xNjBNSFpfSU5fNUcgfAo+Pj4gKyBJRUVFODAyMTFfSEVfUEhZX0NBUDBfQ0hBTk5F
TF9XSURUSF9TRVRfODBQTFVTODBfTUhaX0lOXzVHKSkgPT0gMCkgewo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGllZWU4MDIxMV9laHRfbWNzX25zc19zdXBwXzIwbWh6
X29ubHkgCj4+PiAqYndfMjAgPQo+Pj4gKyAmZWh0X2NhcC0+ZWh0X21jc19uc3Nfc3VwcC5vbmx5
XzIwbWh6Owo+Pj4gKwo+PiBUaGlzIGlzIHRoZSBJRXMgb2YgbXkgQVAgYmVsb3csIHRoZW4gaXQg
d2lsbCBzdGlsbCBlbnRlcmVkIGludG8gdGhpcyAKPj4gYnJhbmNoIGZvciBteSBhdGgxMmsgc3Rh
dGlvbiBtb2RlLgo+PiBzdGEtPmRlZmxpbmsuZWh0X2NhcCBhbmQgc3RhLT5kZWZsaW5rLmhlX2Nh
cCBpcyBjb3BpZWQgZnJvbSBwZWVyIAo+PiByZW1vdGUsIGZvciBhdGgxMmsgc3RhdGlvbiBtb2Rl
LCBwZWVyCj4+IHJlbW90ZSBpcyB0aGUgQVAuIFRoZSBmaWVsZCBvbmx5XzIwbWh6IGlzIG9ubHkg
dmFsaWQgd2hlbiB0aGUgSUVzIGlzIAo+PiBmcm9tIGEgc3RhdGlvbiB3aGljaCBvbmx5IHN1cHBv
cnQKPj4gMjAgTUh6Lgo+Pgo+PiBJIHRoaW5rIHRoZSBmbGFnIGZyb21fYXAgc2hvdWxkIGJlIGFk
ZGVkIGhlcmUgYXMgd2VsbCBhcyBmdW5jdGlvbiAKPj4gaWVlZTgwMjExX2VodF9tY3NfbnNzX3Np
emUoKS4KPj4KPj4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgd3JvbmcuCj4+Cj4KPiBPa2F5LCBjYW4g
eW91IGZpeCB0aGlzIGluIGEgZm9sbG93LXVwIHBhdGNoPwo+IEkgZG9uJ3QgaGF2ZSBhIGRldmlj
ZSB0byB0ZXN0IHRoZSBzdGF0aW9uIG1vZGUgdG8gdmVyaWZ5IGEgZml4Lgo+IFRoYW5rcy4KVGhl
IGZpeCBwYXRjaCBpcyBzaW1wbGUgbGlrZSB0aGlzIChJIGhhdmUgdmVyaWZpZWQgT0spLCB5b3Ug
Y2FuIG1lcmdlIGl0IAp0byB5b3VyIHBhdGNoLvCfmIEKCkl0IGlzIHRvIG5vdCB1c2Ugb25seV8y
MG1oeiB3aGVuIGF0aDEyayBpcyBzdGF0aW9uIG1vZGUuCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9tYWMuYyAKYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTJrL21hYy5jCmluZGV4IGY0MjI2ZDBhNDcyNi4uN2UwOTlhYmI5OWU2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL21hYy5jCisrKyBiL2RyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGgxMmsvbWFjLmMKQEAgLTI0ODIsNiArMjQ4Miw3IEBAIHN0YXRpYyB2
b2lkIGF0aDEya19wZWVyX2Fzc29jX2hfZWh0KHN0cnVjdCBhdGgxMmsgKmFyLAogwqDCoMKgwqDC
oMKgwqAgY29uc3Qgc3RydWN0IGllZWU4MDIxMV9laHRfbWNzX25zc19zdXBwX2J3ICptY3NfbnNz
X3N1cHBfYnc7CiDCoMKgwqDCoMKgwqDCoCB1OCBtY3NfaWR4ID0gV01JX0VIVENBUF9UWFJYX01D
U19OU1NfSURYXzgwOworwqDCoMKgwqDCoMKgIGJvb2wgaXNfbG9jYWxfc3RhID0gYXJ2aWYtPnZp
Zi0+dHlwZSA9PSBOTDgwMjExX0lGVFlQRV9TVEFUSU9OOwoKIMKgwqDCoMKgwqDCoMKgIGVodF9j
YXAgPSAmc3RhLT5saW5rW2xpbmtfaWRdLT5laHRfY2FwOwoKQEAgLTI1MjIsNyArMjUyMyw3IEBA
IHN0YXRpYyB2b2lkIGF0aDEya19wZWVyX2Fzc29jX2hfZWh0KHN0cnVjdCBhdGgxMmsgKmFyLAog
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZhbGx0aHJvdWdoOwoKIMKgwqDCoMKgwqDC
oMKgIGRlZmF1bHQ6Ci3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICgoaGVfY2FwLT5o
ZV9jYXBfZWxlbS5waHlfY2FwX2luZm9bMF0gJgorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAoIWlzX2xvY2FsX3N0YSAmJiAKKGhlX2NhcC0+aGVfY2FwX2VsZW0ucGh5X2NhcF9pbmZv
WzBdICYpIHsKCgotLSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK

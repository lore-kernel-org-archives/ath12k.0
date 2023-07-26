Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A71C001DC
	for <ath12k@archiver.kernel.org>; Wed, 26 Jul 2023 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9sR5snURbESjE9fpoC1mCdOCoj4ZFt+QW0FFcciB4I=; b=Gu5MPpW9zKUHFU
	NDA1j/MQUDrdE8a58wyIzp8GsKnDvRTOM3USeIaSIo/qz9p1FsvetKShwFy8dCVJNuyqmnuzvtSzQ
	PwmO5bVMyyX01SpWTyWNHzHAA0JISluIZtxzrM8uvNg9oJ6BPTHrCMjg2WV0n2VwyMbmCagAxeSjn
	uzzNnK1Dv4n2OD1NwHaS2FDL2DZl6TUmV3KVrVBdUv9Xf/ntbop18KOV/7cHuog4XIhYVFTQ7TMnU
	Fchep+yIpusu67NIe1eY/MyQoZduHexCT+6FQ3JCrfiQEPrDfL2goz+Qb1KwlzUek0SMS2tDjzO6v
	QlKida/FMQ4I4OQ8G/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhWi-00B1mG-0s
	for ath12k@archiver.kernel.org;
	Wed, 26 Jul 2023 16:38:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhWe-00B1kI-1Z
	for ath12k@lists.infradead.org;
	Wed, 26 Jul 2023 16:38:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36QD0Pj8013350;
	Wed, 26 Jul 2023 16:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xGKt1zTVOiCFCvRZdLmWEclcAJdPKv3tOfW7w4PDkdM=;
 b=mosO7Nzyib9GC1fKrqMMdR6pQPShSEk6Uw+Gs6+WVNQfjFpiIqMR9uqH0GUVQWnD5TAw
 rhO57Oyezi1NlBcGGPqKri0BxgBXkoUxL4jt6ovnVT2vl0aQYVpaWqbjPwT+cew+yWQG
 5hl3jM9XM05bIar9rLUz1QbfD0JDIQs7Yz/2NHIv/qWR/rw5Tk8wi2ygaLNI069K6DsB
 1UKpWTkssgWW0odx+khzvBGbkf5WyUEmHLQnRk8zm9u8EH1d0GAk+dP0FBhyn4AJKP93
 6D+NWXldkeLP5BMKpRud6yjsZE9+aFko6spSGQA2ilvEfb3JZy29QI4hKClDgLXIHQmc 8A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s2drabe7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 16:38:09 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36QGc8mK011237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 16:38:08 GMT
Received: from [10.110.108.92] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 26 Jul
 2023 09:38:08 -0700
Message-ID: <333fd74a-4178-3cef-5748-62a14ba2da5a@quicinc.com>
Date: Wed, 26 Jul 2023 09:38:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 06/11] wifi: ath12k: prepare EHT peer assoc parameters
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
CC: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
References: <20230725224034.14045-1-quic_alokad@quicinc.com>
 <20230725224034.14045-7-quic_alokad@quicinc.com>
 <293dd873-1d9d-afc0-a122-48dfe4bb0fde@quicinc.com>
Content-Language: en-US
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <293dd873-1d9d-afc0-a122-48dfe4bb0fde@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VnJ9tw1XStxTmSGMmkX_GpmQl8ZcBOVm
X-Proofpoint-ORIG-GUID: VnJ9tw1XStxTmSGMmkX_GpmQl8ZcBOVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_07,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307260148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_093812_528064_51E4E699 
X-CRM114-Status: GOOD (  18.97  )
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

T24gNy8yNS8yMDIzIDg6NDMgUE0sIFdlbiBHb25nIHdyb3RlOgo+IE9uIDcvMjYvMjAyMyA2OjQw
IEFNLCBBbG9rYSBEaXhpdCB3cm90ZToKPiBbLi4uXQo+PiArCj4+ICtzdGF0aWMgdm9pZCBhdGgx
MmtfcGVlcl9hc3NvY19oX2VodChzdHJ1Y3QgYXRoMTJrICphciwKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpZWVlODAyMTFfdmlmICp2aWYsCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaWVlZTgwMjExX3N0
YSAqc3RhLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IGF0aDEya193bWlfcGVlcl9hc3NvY19hcmcgKmFyZykKPj4gK3sKPj4gK8KgwqDCoCBjb25zdCBz
dHJ1Y3QgaWVlZTgwMjExX3N0YV9laHRfY2FwICplaHRfY2FwID0gJnN0YS0+ZGVmbGluay5laHRf
Y2FwOwo+PiArwqDCoMKgIGNvbnN0IHN0cnVjdCBpZWVlODAyMTFfc3RhX2hlX2NhcCAqaGVfY2Fw
ID0gJnN0YS0+ZGVmbGluay5oZV9jYXA7Cj4gWy4uLl0KPj4gK8KgwqDCoCBkZWZhdWx0Ogo+PiAr
wqDCoMKgwqDCoMKgwqAgaWYgKChoZV9jYXAtPmhlX2NhcF9lbGVtLnBoeV9jYXBfaW5mb1swXSAm
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKElFRUU4MDIxMV9IRV9QSFlfQ0FQMF9DSEFO
TkVMX1dJRFRIX1NFVF80ME1IWl9JTl8yRyB8Cj4+ICsgICAgICAgICAgICAgIAo+PiBJRUVFODAy
MTFfSEVfUEhZX0NBUDBfQ0hBTk5FTF9XSURUSF9TRVRfNDBNSFpfODBNSFpfSU5fNUcgfAo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSUVFRTgwMjExX0hFX1BIWV9DQVAwX0NIQU5ORUxf
V0lEVEhfU0VUXzE2ME1IWl9JTl81RyB8Cj4+ICsgICAgICAgICAgICAgIAo+PiBJRUVFODAyMTFf
SEVfUEhZX0NBUDBfQ0hBTk5FTF9XSURUSF9TRVRfODBQTFVTODBfTUhaX0lOXzVHKSkgPT0gMCkg
ewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgaWVlZTgwMjExX2VodF9t
Y3NfbnNzX3N1cHBfMjBtaHpfb25seSAqYndfMjAgPQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgJmVodF9jYXAtPmVodF9tY3NfbnNzX3N1cHAub25seV8yMG1oejsK
Pj4gKwo+IFRoaXMgaXMgdGhlIElFcyBvZiBteSBBUCBiZWxvdywgdGhlbiBpdCB3aWxsIHN0aWxs
IGVudGVyZWQgaW50byB0aGlzIAo+IGJyYW5jaCBmb3IgbXkgYXRoMTJrIHN0YXRpb24gbW9kZS4K
PiBzdGEtPmRlZmxpbmsuZWh0X2NhcCBhbmQgc3RhLT5kZWZsaW5rLmhlX2NhcCBpcyBjb3BpZWQg
ZnJvbSBwZWVyIHJlbW90ZSwgCj4gZm9yIGF0aDEyayBzdGF0aW9uIG1vZGUsIHBlZXIKPiByZW1v
dGUgaXMgdGhlIEFQLiBUaGUgZmllbGQgb25seV8yMG1oeiBpcyBvbmx5IHZhbGlkIHdoZW4gdGhl
IElFcyBpcyAKPiBmcm9tIGEgc3RhdGlvbiB3aGljaCBvbmx5IHN1cHBvcnQKPiAyMCBNSHouCj4g
Cj4gSSB0aGluayB0aGUgZmxhZyBmcm9tX2FwIHNob3VsZCBiZSBhZGRlZCBoZXJlIGFzIHdlbGwg
YXMgZnVuY3Rpb24gCj4gaWVlZTgwMjExX2VodF9tY3NfbnNzX3NpemUoKS4KPiAKPiBQbGVhc2Ug
Y29ycmVjdCBtZSBpZiB3cm9uZy4KPiAKCk9rYXksIGNhbiB5b3UgZml4IHRoaXMgaW4gYSBmb2xs
b3ctdXAgcGF0Y2g/CkkgZG9uJ3QgaGF2ZSBhIGRldmljZSB0byB0ZXN0IHRoZSBzdGF0aW9uIG1v
ZGUgdG8gdmVyaWZ5IGEgZml4LgpUaGFua3MuCgotLSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgx
MmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMmsK

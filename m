Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588CBEB64DD
	for <ath12k@archiver.kernel.org>; Mon, 24 Jul 2023 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/EGI7NE7ngf0AFnEiClJ6tK02MLwC6SR2cpHuVHvxLM=; b=HaSy9pNH0rfzeY
	wqKFZ0eumajAmXE0Z83SzHvZaBYImN2KzPUNk2I5dnbJHGFvzWID+r/2du6x/VmZzB70UtSeCllmj
	mSg3g9JZNB2ayizKb4qC5Uv4xX/oX/maEsK03ybXu2oubGck7dBx+TUoZvQtr4g079/qWzC+aDvQn
	i8PAlJ+kWfDTpkqIc/x1nDzQo5RZvnuiecpGxqgi8QNiAAVuQvO0xFasq0cJiqR4id0IC0PDn2pBr
	qFefen1XyhMd63EIBjioTrlXMBzL/C0I7QOyOVpYLilxwmgtP8Ui1IlDltNjKFl2Qf45n5OIqZTvg
	8qPAi0w85upFIkFEcaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO0EN-005C0e-0G
	for ath12k@archiver.kernel.org;
	Mon, 24 Jul 2023 18:24:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO0EJ-005C06-2V
	for ath12k@lists.infradead.org;
	Mon, 24 Jul 2023 18:24:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36OHWjuK003433;
	Mon, 24 Jul 2023 18:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NHlNKYctdsDtW9Sj16H5Ck6B6KRi5eEDAoockdqhAfU=;
 b=TPhMVSlJV10FYvwqIL/bEk1wWtYAMnyTXN7O+krVIkM65vdzUJZg0l38awsHcogEmI23
 My4xJPSCun2s3uv1jrVhVXaUTxR5lGeQHPdd6xFBYM4et3lx0tg5Q51fMKFwsT8ZQzRt
 lSEtw7QcLXTxjWnOztll8RXBYSHXuQzOGYdD8z33M4BDQsmnw5bsdDR5qtc8XXVc55Wq
 79i9l03G/xoUhtNQpGWxsnrTNaJSn36Kzg2hMHIS1m47y0QKiirrKWRLfszvTuH7Bagu
 Oi7nIjOloWcwfhQzU9ZODAvyQ5JzhKj9/BFTF5f2E+mJAVcfnniwoVfFUQvK2v9LnrlE 9w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s1u3t8m6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 18:24:21 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36OIOL9m031618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 18:24:21 GMT
Received: from [10.227.89.240] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 24 Jul
 2023 11:24:20 -0700
Message-ID: <cdfbb85a-f3be-8cdc-7117-7550d3808a13@quicinc.com>
Date: Mon, 24 Jul 2023 11:24:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 06/11] wifi: ath12k: prepare EHT peer assoc parameters
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
CC: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
References: <20230602235820.23912-1-quic_alokad@quicinc.com>
 <20230602235820.23912-7-quic_alokad@quicinc.com>
 <f4515520-1d3b-1b07-6ddd-ae269c12a91f@quicinc.com>
Content-Language: en-US
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <f4515520-1d3b-1b07-6ddd-ae269c12a91f@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: In2ZJJEhe5Y6ln-e-XA2bzDY27JeNx2g
X-Proofpoint-ORIG-GUID: In2ZJJEhe5Y6ln-e-XA2bzDY27JeNx2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_14,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=866 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307240163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_112423_824537_BA385F97 
X-CRM114-Status: GOOD (  15.92  )
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

T24gNy8yNC8yMDIzIDM6MTYgQU0sIFdlbiBHb25nIHdyb3RlOgo+IE9uIDYvMy8yMDIzIDc6NTgg
QU0sIEFsb2thIERpeGl0IHdyb3RlOgo+PiAuLi4KPj4gK8KgwqDCoCBkZWZhdWx0Ogo+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKGFyZy0+cGVlcl9waHltb2RlID09IE1PREVfMTFCRV9FSFQyMCkgewo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgaWVlZTgwMjExX2VodF9tY3Nf
bnNzX3N1cHBfMjBtaHpfb25seSAqYndfMjAgPQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgJmVodF9jYXAtPmVodF9tY3NfbnNzX3N1cHAub25seV8yMG1oejsKPiAK
PiBXaGVuIGF0aDEyayB1c2VkIGFzIHN0YXRpb24gbW9kZSwgaXQgZW50ZXJlZCBoZXJlIGFzIHdl
bGwgYXMgQVAgbW9kZS4KPiAKPiBCdXQgcmVtb3RlIGlzIEFQIGRldmljZSBmb3Igc3RhdGlvbiBt
b2RlLCB0aGVuIHJlbW90ZSBBUCBkZXZpY2UgZG8gbm90IAo+IGhhdmUgdGhlIG9ubHlfMjBtaHog
ZGF0YShFSFQtTUNTIE1hcCAoMjAgTUh6LU9ubHkgTm9uLUFQIFNUQSkpLgo+IAoKV2hhdCBpc3N1
ZSBhcmUgeW91IHNlZWluZz8gUGxlYXNlIGVsYWJvcmF0ZS4KClRoZSBkZWZhdWx0IGNhc2Ugd2ls
bCBiZSBlbnRlcmVkIGZvciBib3RoIEFQIGFuZCBub24tQVAgU1RBIG1vZGVzIGZvciAKYWxsIGJh
bmR3aWR0aHMuCgpJZiB0aGUgZGV2aWNlIGlzIGEgMjAtTUh6LW9ubHkgZGV2aWNlLCBpdCB3aWxs
IHNraXAgMzIwLCAxNjAgYW5kIApkaXJlY3RseSBlbnRlciB0aGUgZGVmYXVsdCBjYXNlIHdoZXJl
ICdpZicgY29uZGl0aW9uIHdpbGwgYmUgdHJ1ZS4KCklmIHRoZSBkZXZpY2UgaXMgbm90IGEgMjAt
TUhaLW9ubHkgZGV2aWNlIHRoZW4gaXQgd2lsbCBlbnRlciB0aGUgJ2Vsc2UnIApjb25kaXRpb24g
YWZ0ZXIgcHJvY2Vzc2luZyAzMjAgYW5kIDE2MCBhcyBhcHBsaWNhYmxlLgoKPiBBbHNvIDIwIE1I
eiBzaG91bGQgYmUgc2FtZSBmb3IgNSBHSHovNiBHSHooTU9ERV8xMUJFX0VIVDIwKSBhbmQgMi40
IAo+IEdIeihNT0RFXzExQkVfRUhUMjBfMkcpLCByaWdodD8KPiAKCkdvb2QgcG9pbnQsIEkgd2ls
bCBhZGQgYSBjaGVjayBmb3IgTU9ERV8xMUJFX0VIVDIwXzJHIGFzIHdlbGwgaGVyZS4KCj4+ICsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXRoMTJrX21hY19zZXRfZWh0X21jcyhid18yMC0+
cnhfdHhfbWNzN19tYXhfbnNzLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBid18yMC0+cnhfdHhfbWNzOV9tYXhfbnNzLAo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBid18yMC0+cnhf
dHhfbWNzMTFfbWF4X25zcywKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYndfMjAtPnJ4X3R4X21jczEzX21heF9uc3MsCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZyeF9tY3NbV01J
X0VIVENBUF9UWFJYX01DU19OU1NfSURYXzgwXSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnR4X21jc1tXTUlfRUhUQ0FQX1RYUlhfTUNT
X05TU19JRFhfODBdKTsKPj4gK8KgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJ3ID0gJmVodF9jYXAtPmVodF9tY3NfbnNzX3N1cHAuYncuXzgwOwo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhdGgxMmtfbWFjX3NldF9laHRfbWNzKGJ3LT5yeF90eF9t
Y3M5X21heF9uc3MsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJ3LT5yeF90eF9tY3M5X21heF9uc3MsCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJ3LT5yeF90eF9tY3MxMV9tYXhf
bnNzLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBidy0+cnhfdHhfbWNzMTNfbWF4X25zcywKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnJ4X21jc1tXTUlfRUhUQ0FQX1RYUlhfTUNT
X05TU19JRFhfODBdLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAmdHhfbWNzW1dNSV9FSFRDQVBfVFhSWF9NQ1NfTlNTX0lEWF84MF0pOwo+
PiArwqDCoMKgwqDCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBhcmctPnBlZXJfZWh0
X21jc19jb3VudCsrOwo+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqAgfQo+PiAr
fQo+PiArCj4gCj4gLi4uCgoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTJrCg==

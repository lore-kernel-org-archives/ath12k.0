Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D92EC001E0
	for <ath12k@archiver.kernel.org>; Thu, 27 Jul 2023 16:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hi/ApMeCFCLzvPNlVgvGfgG8QQxciBqU4e7HJFCI0fo=; b=WKbzcxNUBpcPBX
	KFbEv+UJWfkSLqkpgfpaD94YpB5/XyNRfbimuT5qdk0Cpcr7ShSJYv6q9866pOKnjVT1IALUFQV8E
	F6KPz+9SyhwmTfw6WfIuYKJLMtQK2I9xLGlAYCJm2tmk1xvksB3B2NQxf2AiPtGNIOeZgM818r+bM
	B9Zp2T3q1xcIFWKm8BySS1bP+IQgDuo2jtS+vDU0gCP3vW2HQTVyBRQz3ZP0fpyWhQFFt9qln4E5J
	a+LgHIZZXq6e6eEgM6oE0kNuM+t+j0+6YuHrS4ryrtBOHmKmxRTLKCydBRBhmb27rumkxe0rF84PA
	1TH5TiNtJB0Y0TbQhUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP4Kj-00H05P-2U
	for ath12k@archiver.kernel.org;
	Thu, 27 Jul 2023 16:59:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP4Kg-00Gzym-2a
	for ath12k@lists.infradead.org;
	Thu, 27 Jul 2023 16:59:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36RGfCdE015523;
	Thu, 27 Jul 2023 16:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tv8JT390mOUp9ndiysJOb7NObGF6Wy7aHLN1xLb+lWQ=;
 b=dXj1/We2BcrRDszRsTewYDXqx3gn1Ug77/7N022A7Au0enHnCwack2inFPdBNOlGq8Z6
 NfnzRM3YsYQ3H2o9hdeYMzhldOqN8sgdLMdTMTGB9/pvKP1gWdQfrH5yaN4KAq37h9c3
 DHcJIWgaV0+bW9F1XMVWVizYKzgQ+pJ0PFkEVUCT29YjD36GropSdtrwLfTr3jB7lLbe
 7Ma9j4KUq8cBb2aR4WXYB7QfxxBs9h/QXASOg3PasgWMVhrN80uhcvTWN8wtMzR54mS3
 6L5+qp1HRFXXW4mcrTGv4w8XOvKmMZzeIk5KAq/FkJYXcIeh4g+r3V1cE1Kbdk8lZfFL JQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s37g0jptk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 16:59:17 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36RGxFZO004130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 16:59:15 GMT
Received: from [10.227.89.240] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 09:59:15 -0700
Message-ID: <eac30246-1360-2854-3f53-28bdf5a24e24@quicinc.com>
Date: Thu, 27 Jul 2023 09:59:14 -0700
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
 <333fd74a-4178-3cef-5748-62a14ba2da5a@quicinc.com>
 <47396ec0-a0b3-8275-b29d-9ed72a9922cf@quicinc.com>
Content-Language: en-US
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <47396ec0-a0b3-8275-b29d-9ed72a9922cf@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QXSVlbefc47C3tVB2q5dYPqMNUo6nvCH
X-Proofpoint-ORIG-GUID: QXSVlbefc47C3tVB2q5dYPqMNUo6nvCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_07,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_095923_007881_810487CA 
X-CRM114-Status: GOOD (  18.86  )
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

T24gNy8yNi8yMDIzIDEwOjQ4IFBNLCBXZW4gR29uZyB3cm90ZToKPiBPbiA3LzI3LzIwMjMgMTI6
MzggQU0sIEFsb2thIERpeGl0IHdyb3RlOgo+PiBPbiA3LzI1LzIwMjMgODo0MyBQTSwgV2VuIEdv
bmcgd3JvdGU6Cj4+PiBPbiA3LzI2LzIwMjMgNjo0MCBBTSwgQWxva2EgRGl4aXQgd3JvdGU6Cj4+
PiBbLi4uXQo+Pj4+ICsKPj4+PiArc3RhdGljIHZvaWQgYXRoMTJrX3BlZXJfYXNzb2NfaF9laHQo
c3RydWN0IGF0aDEyayAqYXIsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHN0cnVjdCBpZWVlODAyMTFfdmlmICp2aWYsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpZWVlODAyMTFfc3RhICpzdGEsCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhdGgxMmtfd21pX3Bl
ZXJfYXNzb2NfYXJnICphcmcpCj4+Pj4gK3sKPj4+PiArCj4+PiBUaGlzIGlzIHRoZSBJRXMgb2Yg
bXkgQVAgYmVsb3csIHRoZW4gaXQgd2lsbCBzdGlsbCBlbnRlcmVkIGludG8gdGhpcyAKPj4+IGJy
YW5jaCBmb3IgbXkgYXRoMTJrIHN0YXRpb24gbW9kZS4KPj4+IHN0YS0+ZGVmbGluay5laHRfY2Fw
IGFuZCBzdGEtPmRlZmxpbmsuaGVfY2FwIGlzIGNvcGllZCBmcm9tIHBlZXIgCj4+PiByZW1vdGUs
IGZvciBhdGgxMmsgc3RhdGlvbiBtb2RlLCBwZWVyCj4+PiByZW1vdGUgaXMgdGhlIEFQLiBUaGUg
ZmllbGQgb25seV8yMG1oeiBpcyBvbmx5IHZhbGlkIHdoZW4gdGhlIElFcyBpcyAKPj4+IGZyb20g
YSBzdGF0aW9uIHdoaWNoIG9ubHkgc3VwcG9ydAo+Pj4gMjAgTUh6Lgo+Pj4KPj4+IEkgdGhpbmsg
dGhlIGZsYWcgZnJvbV9hcCBzaG91bGQgYmUgYWRkZWQgaGVyZSBhcyB3ZWxsIGFzIGZ1bmN0aW9u
IAo+Pj4gaWVlZTgwMjExX2VodF9tY3NfbnNzX3NpemUoKS4KPj4+Cj4+PiBQbGVhc2UgY29ycmVj
dCBtZSBpZiB3cm9uZy4KPj4+Cj4+Cj4+IE9rYXksIGNhbiB5b3UgZml4IHRoaXMgaW4gYSBmb2xs
b3ctdXAgcGF0Y2g/Cj4+IEkgZG9uJ3QgaGF2ZSBhIGRldmljZSB0byB0ZXN0IHRoZSBzdGF0aW9u
IG1vZGUgdG8gdmVyaWZ5IGEgZml4Lgo+PiBUaGFua3MuCj4gVGhlIGZpeCBwYXRjaCBpcyBzaW1w
bGUgbGlrZSB0aGlzIChJIGhhdmUgdmVyaWZpZWQgT0spLCB5b3UgY2FuIG1lcmdlIGl0IAo+IHRv
IHlvdXIgcGF0Y2gu8J+YgQo+IAo+IEl0IGlzIHRvIG5vdCB1c2Ugb25seV8yMG1oeiB3aGVuIGF0
aDEyayBpcyBzdGF0aW9uIG1vZGUuCj4gCgpUaGFua3MgV2VuLgoKSXQgd291bGQgYmUgc2ltcGxl
ciBpZiB0aGUgY3VycmVudCB2ZXJzaW9uLCB3aGljaCB3b3JrcyBmb3IgdGhlIG1ham9yaXR5IApv
ZiBjYXNlcyBmb3IgYm90aCBBUCBhbmQgbm9uLUFQIFNUQSBtb2RlLCBnZXRzIHJldmlld2VkIGZp
cnN0IApjb25zaWRlcmluZyAxMC8xMSBwYXRjaGVzIHdpbGwgcmVtYWluIHNhbWUgZm9yIHRoZSBu
ZXh0IHZlcnNpb24uCkV2ZXJ5IHRpbWUgSSByZS1iYXNlIHRoZSBzZXJpZXMgSSBoYXZlIHRvIHRl
c3QsIGFkZCBjb3Zlci1sZXR0ZXIsIApjaGFuZ2UtbG9nIGluIDExIHBhdGNoZXMuIFNlZW1zIGxp
a2UgYW4gb3ZlcmtpbGwgZm9yIGEgbm9uLWNyYXNoIHJlbGF0ZWQgCmZpeCB3aGljaCBjYW4gYmUg
cmV2aWV3ZWQgc2VwYXJhdGVseS4KCkxldCdzIHNlZSB3aGF0IEthbGxlIHRoaW5rcy4KCgotLSAK
YXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK

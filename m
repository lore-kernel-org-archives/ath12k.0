Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D36BC0015E
	for <ath12k@archiver.kernel.org>; Wed, 26 Jul 2023 03:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QK0PAEi3WYeWmqP3glIfSSiK07C0d2bZInXvMGQaP7A=; b=qvR5rqh0bEiTsO
	MalnU/44qp84q5VZ7EOXMYWcA/e90yhkW/uUbWTQozQLQTufDvwEnLilS7nb5TRZpf5fcyWDohrxD
	wqi48YspH47aoJ2G64Nh+a2ggswl4a4tarubU6NTTR29Wa9nbHxMgvpSOMzlm5SivvigSEhtj0/5a
	xwxRxGQb6faTPfhRDAIQXa+w2FGtdqs0qf/nKNp8metVZq7Saa0pKYlpJZ/moicKsyG8Zhu/h2Xb7
	E889c0a/e3dCcpjN/3zSsN240c0KNnQFEfrIQfM/9weW4dcYBIHO2j3b7WpfejksFJch7mIq79OgJ
	WcEQpLaHdqA9qqJz1qsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOVRY-0091FC-2w
	for ath12k@archiver.kernel.org;
	Wed, 26 Jul 2023 03:44:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOVRV-0091EQ-0b
	for ath12k@lists.infradead.org;
	Wed, 26 Jul 2023 03:44:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q1vo3V021485;
	Wed, 26 Jul 2023 03:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=kziEQLUySX2lc5jw48DvsuK1owDpMXOhKodUIh9p+ps=;
 b=Uu+nxm0chhzkKOKiT6AJEjhpUjw2r15VxyROuwmxlK4MnTPvL2E7cQujmLOygg5P0tgm
 wPqOMSxpuOZXZcVCM7yBTd8fd8CbTBhxnmKVq1WTPfke1T0NPeEXJA+HBvBxWbOQ3sd5
 uT0R8L65gwnmve2JBZB8hJ3R+GYTTEZn6DqRYnFM9ZBA7sghmO5CfcqZc1dHSpRT7j0s
 WNH4ckt53PlaE0/VULNyrH0EQmlfev4XsEhSa1uprwQXQNwFyRPrJyrfwCIUilG1XlvL
 C4Z7rL51QpB6ux6ipf/prscfoC3rCAPGb7cPuonfooCKVJm9dffYQi/6b92zE9WFLowF JQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s29j5jhuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 03:43:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36Q3hue1029524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 03:43:56 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 25 Jul
 2023 20:43:54 -0700
Message-ID: <293dd873-1d9d-afc0-a122-48dfe4bb0fde@quicinc.com>
Date: Wed, 26 Jul 2023 11:43:52 +0800
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
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20230725224034.14045-7-quic_alokad@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: utCmE-8I8qnT2HRhuJRpCsuawR6lWGxq
X-Proofpoint-GUID: utCmE-8I8qnT2HRhuJRpCsuawR6lWGxq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_14,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307260031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_204405_345607_35E55BE4 
X-CRM114-Status: GOOD (  14.18  )
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

T24gNy8yNi8yMDIzIDY6NDAgQU0sIEFsb2thIERpeGl0IHdyb3RlOgpbLi4uXQo+ICsKPiArc3Rh
dGljIHZvaWQgYXRoMTJrX3BlZXJfYXNzb2NfaF9laHQoc3RydWN0IGF0aDEyayAqYXIsCj4gKwkJ
CQkgICAgc3RydWN0IGllZWU4MDIxMV92aWYgKnZpZiwKPiArCQkJCSAgICBzdHJ1Y3QgaWVlZTgw
MjExX3N0YSAqc3RhLAo+ICsJCQkJICAgIHN0cnVjdCBhdGgxMmtfd21pX3BlZXJfYXNzb2NfYXJn
ICphcmcpCj4gK3sKPiArCWNvbnN0IHN0cnVjdCBpZWVlODAyMTFfc3RhX2VodF9jYXAgKmVodF9j
YXAgPSAmc3RhLT5kZWZsaW5rLmVodF9jYXA7Cj4gKwljb25zdCBzdHJ1Y3QgaWVlZTgwMjExX3N0
YV9oZV9jYXAgKmhlX2NhcCA9ICZzdGEtPmRlZmxpbmsuaGVfY2FwOwpbLi4uXQo+ICsJZGVmYXVs
dDoKPiArCQlpZiAoKGhlX2NhcC0+aGVfY2FwX2VsZW0ucGh5X2NhcF9pbmZvWzBdICYKPiArCQkg
ICAgIChJRUVFODAyMTFfSEVfUEhZX0NBUDBfQ0hBTk5FTF9XSURUSF9TRVRfNDBNSFpfSU5fMkcg
fAo+ICsJCSAgICAgIElFRUU4MDIxMV9IRV9QSFlfQ0FQMF9DSEFOTkVMX1dJRFRIX1NFVF80ME1I
Wl84ME1IWl9JTl81RyB8Cj4gKwkJICAgICAgSUVFRTgwMjExX0hFX1BIWV9DQVAwX0NIQU5ORUxf
V0lEVEhfU0VUXzE2ME1IWl9JTl81RyB8Cj4gKwkJICAgICAgSUVFRTgwMjExX0hFX1BIWV9DQVAw
X0NIQU5ORUxfV0lEVEhfU0VUXzgwUExVUzgwX01IWl9JTl81RykpID09IDApIHsKPiArCQkJY29u
c3Qgc3RydWN0IGllZWU4MDIxMV9laHRfbWNzX25zc19zdXBwXzIwbWh6X29ubHkgKmJ3XzIwID0K
PiArCQkJCQkmZWh0X2NhcC0+ZWh0X21jc19uc3Nfc3VwcC5vbmx5XzIwbWh6Owo+ICsKVGhpcyBp
cyB0aGUgSUVzIG9mIG15IEFQIGJlbG93LCB0aGVuIGl0IHdpbGwgc3RpbGwgZW50ZXJlZCBpbnRv
IHRoaXMgCmJyYW5jaCBmb3IgbXkgYXRoMTJrIHN0YXRpb24gbW9kZS4Kc3RhLT5kZWZsaW5rLmVo
dF9jYXAgYW5kIHN0YS0+ZGVmbGluay5oZV9jYXAgaXMgY29waWVkIGZyb20gcGVlciByZW1vdGUs
IApmb3IgYXRoMTJrIHN0YXRpb24gbW9kZSwgcGVlcgpyZW1vdGUgaXMgdGhlIEFQLiBUaGUgZmll
bGQgb25seV8yMG1oeiBpcyBvbmx5IHZhbGlkIHdoZW4gdGhlIElFcyBpcyAKZnJvbSBhIHN0YXRp
b24gd2hpY2ggb25seSBzdXBwb3J0CjIwIE1Iei4KCkkgdGhpbmsgdGhlIGZsYWcgZnJvbV9hcCBz
aG91bGQgYmUgYWRkZWQgaGVyZSBhcyB3ZWxsIGFzIGZ1bmN0aW9uIAppZWVlODAyMTFfZWh0X21j
c19uc3Nfc2l6ZSgpLgoKUGxlYXNlIGNvcnJlY3QgbWUgaWYgd3JvbmcuCgpFeHQgVGFnOiBIRSBD
YXBhYmlsaXRpZXMgKElFRUUgU3RkIDgwMi4xMWF4L0QzLjApCiDCoMKgwqAgVGFnIE51bWJlcjog
RWxlbWVudCBJRCBFeHRlbnNpb24gKDI1NSkKIMKgwqDCoCBFeHQgVGFnIGxlbmd0aDogMjkKIMKg
wqDCoCBFeHQgVGFnIE51bWJlcjogSEUgQ2FwYWJpbGl0aWVzIChJRUVFIFN0ZCA4MDIuMTFheC9E
My4wKSAoMzUpCiDCoMKgwqAgSEUgTUFDIENhcGFiaWxpdGllcyBJbmZvcm1hdGlvbjogMHgxMDQw
MWEwODAxMGQKIMKgwqDCoCBIRSBQaHkgQ2FwYWJpbGl0aWVzIEluZm9ybWF0aW9uCiDCoMKgwqDC
oMKgwqDCoCAuLi4uIC4uLjAgPSBSZXNlcnZlZDogMHgwCiDCoMKgwqDCoMKgwqDCoCAwMDAwIDAw
MC4gPSBDaGFubmVsIFdpZHRoIFNldDogMHgwMAogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4u
IC4uMC4gPSA0ME1IeiBpbiAyLjRHSHogYmFuZDogTm90IHN1cHBvcnRlZAogwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuLi4uIC4wLi4gPSA0MCAmIDgwTUh6IGluIHRoZSA1R0h6IG9yIDZHSHogYmFu
ZDogTm90IHN1cHBvcnRlZAogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4uIDAuLi4gPSAxNjBN
SHogaW4gdGhlIDVHSHogb3IgNkdIeiBiYW5kOiBOb3Qgc3VwcG9ydGVkCiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC4uLjAgLi4uLiA9IDE2MC84MCs4ME1IeiBpbiB0aGUgNUdIeiBvciA2R0h6IGJh
bmQ6IE5vdCAKc3VwcG9ydGVkCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC4uMC4gLi4uLiA9IDI0
MiB0b25lIFJVcyBpbiB0aGUgMi40R0h6IGJhbmQ6IE5vdCBzdXBwb3J0ZWQKIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLjAuLiAuLi4uID0gMjQyIHRvbmUgUlVzIGluIHRoZSA1R0h6IG9yIDZHSHog
YmFuZDogTm90IApzdXBwb3J0ZWQKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMC4uLiAuLi4uID0g
UmVzZXJ2ZWQ6IDB4MAogwqDCoMKgwqDCoMKgwqAgQml0cyA4IHRvIDIzOiAweDQwNjMKIMKgwqDC
oMKgwqDCoMKgIEJpdHMgMjQgdG8gMzk6IDB4MWY4OAogwqDCoMKgwqDCoMKgwqAgQml0cyA0MCB0
byA1NTogMHg4MTQxCiDCoMKgwqDCoMKgwqDCoCBCaXRzIDU2IHRvIDcxOiAweDExMWMKIMKgwqDC
oMKgwqDCoMKgIEJpdHMgNzIgdG8gODc6IDB4MDAwOAogwqDCoMKgIFN1cHBvcnRlZCBIRS1NQ1Mg
YW5kIE5TUyBTZXQKIMKgwqDCoCBQUEUgVGhyZXNob2xkcwoKRXh0IFRhZzogRUhUIENhcGFiaWxp
dGllcyAoSUVFRSBTdGQgODAyLjExYmUvRDIuMCkKIMKgwqDCoCBUYWcgTnVtYmVyOiBFbGVtZW50
IElEIEV4dGVuc2lvbiAoMjU1KQogwqDCoMKgIEV4dCBUYWcgbGVuZ3RoOiAxNQogwqDCoMKgIEV4
dCBUYWcgTnVtYmVyOiBFSFQgQ2FwYWJpbGl0aWVzIChJRUVFIFN0ZCA4MDIuMTFiZS9EMi4wKSAo
MTA4KQogwqDCoMKgIEVIVCBNQUMgQ2FwYWJpbGl0aWVzIEluZm9ybWF0aW9uOiAweDAwMDAKIMKg
wqDCoCBFSFQgUEhZIENhcGFiaWxpdGllcyBJbmZvcm1hdGlvbgogwqDCoMKgIFN1cHBvcnRlZCBF
SFQtTUNTIGFuZCBOU1MgU2V0CiDCoMKgwqDCoMKgwqDCoCBFSFQtTUNTIE1hcCAoQlcgPD0gODBN
SHopOiAweDIyMjIyMgogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4uIC4uLi4gLi4uLiAuLi4u
IC4uLi4gMDAxMCA9IFJ4IE1heCBOc3MgVGhhdCBTdXBwb3J0cyAKRUhULU1DUyAwLTk6IDIKIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLi4uLiAuLi4uIC4uLi4gLi4uLiAwMDEwIC4uLi4gPSBUeCBN
YXggTnNzIFRoYXQgU3VwcG9ydHMgCkVIVC1NQ1MgMC05OiAyCiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC4uLi4gLi4uLiAuLi4uIDAwMTAgLi4uLiAuLi4uID0gUnggTWF4IE5zcyBUaGF0IFN1cHBv
cnRzIApFSFQtTUNTIDEwLTExOiAyCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC4uLi4gLi4uLiAw
MDEwIC4uLi4gLi4uLiAuLi4uID0gVHggTWF4IE5zcyBUaGF0IFN1cHBvcnRzIApFSFQtTUNTIDEw
LTExOiAyCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC4uLi4gMDAxMCAuLi4uIC4uLi4gLi4uLiAu
Li4uID0gUnggTWF4IE5zcyBUaGF0IFN1cHBvcnRzIApFSFQtTUNTIDEyLTEzOiAyCiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDAwMTAgLi4uLiAuLi4uIC4uLi4gLi4uLiAuLi4uID0gVHggTWF4IE5z
cyBUaGF0IFN1cHBvcnRzIApFSFQtTUNTIDEyLTEzOiAyCiDCoMKgwqAgRUhUIFBQRSBUaHJlc2hv
bGRzOiA8TUlTU0lORz4KCj4gKwkJCWF0aDEya19tYWNfc2V0X2VodF9tY3MoYndfMjAtPnJ4X3R4
X21jczdfbWF4X25zcywKPiArCQkJCQkgICAgICAgYndfMjAtPnJ4X3R4X21jczlfbWF4X25zcywK
PiArCQkJCQkgICAgICAgYndfMjAtPnJ4X3R4X21jczExX21heF9uc3MsCj4gKwkJCQkJICAgICAg
IGJ3XzIwLT5yeF90eF9tY3MxM19tYXhfbnNzLAo+ICsJCQkJCSAgICAgICAmcnhfbWNzW1dNSV9F
SFRDQVBfVFhSWF9NQ1NfTlNTX0lEWF84MF0sCj4gKwkJCQkJICAgICAgICZ0eF9tY3NbV01JX0VI
VENBUF9UWFJYX01DU19OU1NfSURYXzgwXSk7Cj4gKwkJfSBlbHNlIHsKPiArCQkJYncgPSAmZWh0
X2NhcC0+ZWh0X21jc19uc3Nfc3VwcC5idy5fODA7Cj4gKwkJCWF0aDEya19tYWNfc2V0X2VodF9t
Y3MoYnctPnJ4X3R4X21jczlfbWF4X25zcywKPiArCQkJCQkgICAgICAgYnctPnJ4X3R4X21jczlf
bWF4X25zcywKPiArCQkJCQkgICAgICAgYnctPnJ4X3R4X21jczExX21heF9uc3MsCj4gKwkJCQkJ
ICAgICAgIGJ3LT5yeF90eF9tY3MxM19tYXhfbnNzLAo+ICsJCQkJCSAgICAgICAmcnhfbWNzW1dN
SV9FSFRDQVBfVFhSWF9NQ1NfTlNTX0lEWF84MF0sCj4gKwkJCQkJICAgICAgICZ0eF9tY3NbV01J
X0VIVENBUF9UWFJYX01DU19OU1NfSURYXzgwXSk7Cj4gKwkJfQo+ICsKPiArCQlhcmctPnBlZXJf
ZWh0X21jc19jb3VudCsrOwo+ICsJCWJyZWFrOwo+ICsJfQo+ICt9Cj4gKwpbLi4uXQoKLS0gCmF0
aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cHM6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==

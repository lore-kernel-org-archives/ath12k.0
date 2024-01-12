Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6574C4706C
	for <ath12k@archiver.kernel.org>; Fri, 12 Jan 2024 04:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4m40fwMg/wMB/FsJE/i93PNvAmG5JFhKvuG3fxaFp8=; b=18xEzbNL4OoUnbD7cPiWXWkWmR
	XdU8y8h198fvZMbvG+4d8okuthWjYcplT7NtdYLdMlwihepNAYULTa6QHROcQGQSOcUIM2agILXWT
	O4UH1DkGEYUifm6DdesiUE3NEAhGOiXDExGj2iimjrTcAEroD/A6i7HMbttbjb/2SPcg2Fxfbbwo+
	UrQcpgF83BM3xFgjntiOSu7dXaGFIOhxU5iM+fQHpFcbC5W33vLWP3SWBXhj7kmHgfihOwKXDIcYg
	BoTRd8Xy6ZhxWnVQ0skFuNuHppgXQ/HbSBtsRzfT6QdLpFILj8y/EthLylBf7WtMKCzGpaYRpd7iW
	xepAb5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO9FK-001rcQ-1f
	for ath12k@archiver.kernel.org;
	Fri, 12 Jan 2024 04:34:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO9FH-001ray-2S
	for ath12k@lists.infradead.org;
	Fri, 12 Jan 2024 04:34:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40C4JpaU007577;
	Fri, 12 Jan 2024 04:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	qcppdkim1; bh=Q4m40fwMg/wMB/FsJE/i93PNvAmG5JFhKvuG3fxaFp8=; b=On
	cK6186qCHiMSPbZ+pRot0sKITUPCM/VunDBnWsiQy5rU8usEIIetxzr0GsimHMJ4
	2vUat6+d+uuM8xwIMs2856musT3pcpEqZBJAA3EapVQO5wdeLa6bGbcpPOVpDUZX
	B5Dcy7fZBq0w/jMT2kpBNJDa9rgjaGvUmggFdMvnmM0zLxAht4YwQNm29ZPV/PUj
	9EQae2Cblkiim1esboekNvIWkNpEENLH4CS7A+DuDHpGhQX2bmGOHsp68/VLLf/7
	Wh742S6Tpb2ES4LUyNsG7MJaevF8LiJqTkVvE/0SFof0/UH7PxHqVFVC7m2CMlTm
	mzNKJUQv9aPuoL4rWPNQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjpuj0t97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 04:34:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40C4YDRe018179
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 04:34:13 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 11 Jan 2024 20:34:13 -0800
Received: from nalasex01a.na.qualcomm.com ([fe80::4c50:85be:1649:87eb]) by
 nalasex01a.na.qualcomm.com ([fe80::4c50:85be:1649:87eb%4]) with mapi id
 15.02.1118.040; Thu, 11 Jan 2024 20:34:13 -0800
From: "Sriram R (QUIC)" <quic_srirrama@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
        "Sriram R (QUIC)"
	<quic_srirrama@quicinc.com>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH 00/12] wifi: ath12k: Add single wiphy support
Thread-Topic: [PATCH 00/12] wifi: ath12k: Add single wiphy support
Thread-Index: AQHaREnRMm8ohGOPKECTigDMaWE1n7DVk4iAgACLLeA=
Date: Fri, 12 Jan 2024 04:34:13 +0000
Message-ID: <606709d9eab84207b0ab73d12e7defcd@quicinc.com>
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
 <f1431217-447e-4d1e-a97c-e5cea6ff2c36@quicinc.com>
In-Reply-To: <f1431217-447e-4d1e-a97c-e5cea6ff2c36@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.43.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: R-fjS3CtAUv2BtOGpIdcs_c9NHusYxiJ
X-Proofpoint-ORIG-GUID: R-fjS3CtAUv2BtOGpIdcs_c9NHusYxiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=652 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_203415_810076_98A45B05 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSmVmZiBKb2huc29uIChRVUlDKSA8
cXVpY19qam9obnNvbkBxdWljaW5jLmNvbT4NCj5TZW50OiBGcmlkYXksIEphbnVhcnkgMTIsIDIw
MjQgMTo0NiBBTQ0KPlRvOiBTcmlyYW0gUiAoUVVJQykgPHF1aWNfc3JpcnJhbWFAcXVpY2luYy5j
b20+OyBhdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPkNjOiBsaW51eC13aXJlbGVzc0B2Z2Vy
Lmtlcm5lbC5vcmcNCj5TdWJqZWN0OiBSZTogW1BBVENIIDAwLzEyXSB3aWZpOiBhdGgxMms6IEFk
ZCBzaW5nbGUgd2lwaHkgc3VwcG9ydA0KPg0KPk9uIDEvMTAvMjAyNCA4OjUwIFBNLCBTcmlyYW0g
UiB3cm90ZToNCj4+IFRoaXMgcGF0Y2hzZXQgaXMgZGVwZW5kZW50IG9uICJbUEFUQ0ggMC8yXSB3
aWZpOiBhdGgxMms6IEludHJvZHVjZSBodw0KPmFic3RyYWN0aW9uIg0KPg0KPkknbSBjdXJyZW50
bHkgdW5hYmxlIHRvIGFwcGx5IHRoZSBwcmVyZXF1aXNpdGUgcGF0Y2hlcyB0byBteSB3b3Jrc3Bh
Y2UsIHNvIEkgd29uJ3QNCj5iZSBhYmxlIHRvIHJldmlldyB5b3VyIHBhdGNoZXMgdW50aWwgdGhh
dCBpcyByZXNvbHZlZC4NClN1cmUuIEkgYmVsaWV2ZSBpdHMgcmVzb2x2ZWQgd2l0aCAiW1BBVENI
IHYyIDAvMl0gd2lmaTogYXRoMTJrOiBJbnRyb2R1Y2UgaHcgYWJzdHJhY3Rpb24iLg0KDQpUaGFu
a3MsDQpTcmlyYW0uUg0K


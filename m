Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55594C001DB
	for <ath12k@archiver.kernel.org>; Thu, 10 Aug 2023 04:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXTAAp2yhMIQZFDVoscc9FCkeqJSodBY+i5114Mbamo=; b=keItRAii0todd9
	f9IAUQtIzquConV4qQaodiH6OOvjbmPh0NhbkXoqpiNfrepdHP73FI8ZKcTwk179eAcu3bO8pUTO5
	HK8slt/04pVPX+Y5tCxEP0ibkfrneUWOoq4S/j9kt5iDWKYhNy92p9rXAWXcjRXs0dufFgpN4J2ca
	/AXmcectLi45mIefHJo6u6cY3k2kzzTJWJmKmvXmIUjbSLCg1F1+8/6m33Kua/mnmAC12nAqle8/v
	FuRHEd9rxJoLQh2l0+T0r/L/2hXkzvkmxeaqxcCZQqQfnhwJ0Xywy+3WYo+OXJQQ+sMSsyR7sEM+s
	psK39evjDz0FmlkmWr/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTxKL-006VNJ-09
	for ath12k@archiver.kernel.org;
	Thu, 10 Aug 2023 04:31:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTxKH-006VMi-00
	for ath12k@lists.infradead.org;
	Thu, 10 Aug 2023 04:31:11 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37A3n13B000789;
	Thu, 10 Aug 2023 04:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wlev2qeJ4WmYDKLuS/x8z2R0JwPe54XPqBnP7NgQoqQ=;
 b=mcQGecPy+7MPb+BibJv6RAZmMZKMosY10MvJVXPBbfsm3niqIwmIGSpfsZ9vumj1/duN
 IjMnkkrcaGGS+gP+njM1etjNSor+iOm/wOBhdafQTqhyzXa+m7K7Lq9jTGtyjdVNcB/2
 NyVUUhC+gzsfsq1pKThi+z4ivzYTEfjM1yXs/yho78uMGmsTqUAGn0n+LVec6nrYV80Z
 N/QN3708xBFtBalpDd3e7YqPHKTY3dPaiu71CoC1VyWnGlLGADdZQlC8bqow08iEkUIv
 9cIOA8Sr6YDGv+Q5PxQJA5jsRh5Bg2l+/5oGcpv3RDKZosIOI0Lz6iSk4+PLS82CkNtX 0w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sch7crpnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 04:31:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37A4V60F010526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 04:31:06 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 9 Aug
 2023 21:31:04 -0700
Message-ID: <db119d06-7549-3be9-524f-327485d34da9@quicinc.com>
Date: Thu, 10 Aug 2023 12:31:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] wifi: ath12k: Fix buffer overflow when scanning with
 extraie
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230809081241.32765-1-quic_wgong@quicinc.com>
 <4e63a318-2aa0-2993-ae03-5544c6e41390@quicinc.com>
 <3206e181-f770-c599-87e1-364114b9746a@quicinc.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <3206e181-f770-c599-87e1-364114b9746a@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3a71D-IOYlAES0ebsgtH_dxLIL5byYue
X-Proofpoint-GUID: 3a71D-IOYlAES0ebsgtH_dxLIL5byYue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_03,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=398 mlxscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308100038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_213109_904837_B027B2E7 
X-CRM114-Status: GOOD (  11.16  )
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

T24gOC8xMC8yMDIzIDI6MTYgQU0sIEplZmYgSm9obnNvbiB3cm90ZToKPiBPbiA4LzkvMjAyMyAx
MDozMSBBTSwgSmVmZiBKb2huc29uIHdyb3RlOgo+PiBPbiA4LzkvMjAyMyAxOjEyIEFNLCBXZW4g
R29uZyB3cm90ZToKPj4+ClsuLi5dCj4+Cj4+IFJldmlld2VkLWJ5OiBKZWZmIEpvaG5zb24gPHF1
aWNfampvaG5zb25AcXVpY2luYy5jb20+Cj4KPiBXZW4sIGNhbiB5b3UgcGxlYXNlIGFkZCBhIEZp
eGVzOiB0YWcgc2luY2UgYmFzZWQgdXBvbiB0aGUgZGlzY3Vzc2lvbiAKPiB5b3UgYWN0dWFsbHkg
b2JzZXJ2ZWQgYSBjcmFzaAo+CkplZmYsIGRvIHlvdSBtZWFuIEkgc2hvdWxkIGFkZCB0aGUgY3Jh
c2ggY2FsbCBzdGFjayBvciBvdGhlciB0aGluZyBpbiAKdGhpcyBwYXRjaD8KClRoZSBjcmFzaCBp
cyBvYnNlcnZlZCBieSBTdmVuIEVja2VsbWFubiA8c3ZlbkBuYXJmYXRpb24ub3JnPsKgIG9uIDA3
IERlYyAKMjAyMSBoZXJlOgpTdWJqZWN0OiBSZTogW1BBVENIXSBhdGgxMWs6IGVuYWJsZSAKSUVF
RTgwMjExX0hXX1NJTkdMRV9TQ0FOX09OX0FMTF9CQU5EUyBmb3IgV0NONjg1NQpodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC13aXJlbGVzcy8zMjY3ODA1LmVsOWtramxmVVpAcmlwcGVyLwoK
CgoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==

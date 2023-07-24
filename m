Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9676FC0015E
	for <ath12k@archiver.kernel.org>; Mon, 24 Jul 2023 17:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFGNm4sNfLXJYrqzMZQ2/Amt4bxqF53Y3raalaOazKU=; b=sY4cWx28dsYbiV
	YFQCuVSewiygf0EgQ0tdfhiBio4FtH2jAoOz/gqwtY0SEwHF4j6tTrmtk4658+fyJdZCsXXP91uBX
	Atp7eeRxuQ0kM6pQAyfwoA0iTnUJdOdp4dt29/prMYiCRdfW3N5eqRX/9/GthyY1PbbC9UuRKxWop
	i7qqz8+/X7X/SLJMUIATEeI6t61FS1aHeZ1IgIwbwooWhLdi9OM8ZS2HSzaKJSLa9brDV94jMUVQk
	tjAMcKN1WvNvQUk2hPGWomJ4zZTTDyP0dbS35mbuN3GY+Qt8BT8UNV2f0ABSu2Y5EBGTLsL3+uE6F
	8F0U7RRTIYLMmi/lpEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzZq-0055cF-0d
	for ath12k@archiver.kernel.org;
	Mon, 24 Jul 2023 17:42:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzZn-0055bk-2e
	for ath12k@lists.infradead.org;
	Mon, 24 Jul 2023 17:42:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36ODtY8l027365;
	Mon, 24 Jul 2023 17:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5aAMJ0frHNn0nF9pSsO5x3K2otUuxAETSGfw6+7bMDo=;
 b=THzU4AcsEu9rvCh1lyPPhFM9rcC+LvrYFzjzwxU0NeFAhIHQEP4SWrABsfrqDFF0VNjD
 G8ICJQHMkbutGhI4O3Bz6MRcu1GpOIrCPwn/OYfz3+ou3WugDK8TlJKiSpXPUMwpSo4i
 GUhiLU/o0ulwCq6JIHkjj3aphYk0VtzSD2FcFDvrWWPzTUdIQ4BxYq9WjM8PyXnBVS6W
 YkqvAlZnI0aGWNPF3Sb5mjSoK6eM8vJbyHlx0dUethfAHrPXpIV5E/oO1ha4dhTPot12
 gVB22/M97FtBDXWUM/Nnc+AHQDpKX1ZUHWdo5SNSqtN7nmRCR/vU2hRW2RkKrXOpm8b7 fw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s1qass173-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 17:42:25 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36OHgOIS014766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 17:42:24 GMT
Received: from [10.227.89.240] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 24 Jul
 2023 10:42:23 -0700
Message-ID: <a95b1a2c-a218-972a-4b60-14ff48b9efd6@quicinc.com>
Date: Mon, 24 Jul 2023 10:42:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 03/11] wifi: ath12k: WMI support to process EHT
 capabilities
To: Wen Gong <quic_wgong@quicinc.com>, Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Pradeep
 Kumar Chitrapu" <quic_pradeepc@quicinc.com>
References: <20230602235820.23912-1-quic_alokad@quicinc.com>
 <20230602235820.23912-4-quic_alokad@quicinc.com> <87ttv9aqtn.fsf@kernel.org>
 <844a2d71-d003-abd0-4cf2-f279a1b62ac7@quicinc.com>
Content-Language: en-US
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <844a2d71-d003-abd0-4cf2-f279a1b62ac7@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: L-20drruhXI6vHiTL8bQQZrVFXJZqXof
X-Proofpoint-GUID: L-20drruhXI6vHiTL8bQQZrVFXJZqXof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_12,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=968 adultscore=0 priorityscore=1501
 clxscore=1011 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307240156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_104231_998865_1E14952E 
X-CRM114-Status: GOOD (  13.27  )
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

T24gNi8xNi8yMDIzIDM6NTAgQU0sIFdlbiBHb25nIHdyb3RlOgo+IE9uIDYvMTUvMjAyMyA3OjQ5
IFBNLCBLYWxsZSBWYWxvIHdyb3RlOgo+PiBBbG9rYSBEaXhpdCA8cXVpY19hbG9rYWRAcXVpY2lu
Yy5jb20+IHdyaXRlczoKPj4KPj4+IEFkZCBXTUkgc3VwcG9ydCB0byBwcm9jZXNzIHRoZSBFSFQg
Y2FwYWJpbGl0aWVzIHBhc3NlZCBieQo+Pj4gdGhlIGZpcm13YXJlLiBBZGQgcmVxdWlyZWQgRUhU
IHNwZWNpZmljIGRlZmluaXRpb25zIGluCj4+PiBzdHJ1Y3R1cmVzIGF0aDEya19iYW5kX2NhcCBh
bmQgYXRoMTJrX3dtaV9zdmNfcmR5X2V4dF9wYXJzZS4KPj4+Cj4+PiBGb3Igc2luZ2xlX3BkZXYg
Y2hpcCBzdWNoIGFzIFdDTjc4NTAsIG9ubHkgb25lIHBkZXYgaXMgY3JlYXRlZAo+Pj4gYW5kIG9u
bHkgb25lIGhhcmR3YXJlIGlzIHJlZ2lzdGVyZWQgdG8gbWFjODAyMTEuIFRoaXMgb25lIHBkZXYK
Pj4+IG1hbmFnZXMgYm90aCAyLjQgR0h6IHJhZGlvIGFuZCA1IEdIei82IEdIeiByYWRpby4KPj4+
Cj4+PiBUZXN0ZWQtb246IFFDTjkyNzQgaHcyLjAgUENJIFdMQU4uV0JFLjEuMC4xLTAwMDI5LVFD
QUhLU1dQTF9TSUxJQ09OWi0xCj4+PiBUZXN0ZWQtb246IFdDTjc4NTAgaHcyLjAgUENJIAo+Pj4g
V0xBTi5ITVQuMS4wLTAzNDI3LVFDQUhNVFNXUExfVjEuMF9WMi4wX1NJTElDT05aLTEuMTUzNzgu
NAo+Pj4gU2lnbmVkLW9mZi1ieTogQWxva2EgRGl4aXQgPHF1aWNfYWxva2FkQHF1aWNpbmMuY29t
Pgo+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBQcmFkZWVwIEt1bWFyIENoaXRyYXB1IDxxdWljX3ByYWRl
ZXBjQHF1aWNpbmMuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogUHJhZGVlcCBLdW1hciBDaGl0cmFw
dSA8cXVpY19wcmFkZWVwY0BxdWljaW5jLmNvbT4KPj4+IENvLWRldmVsb3BlZC1ieTogV2VuIEdv
bmcgPHF1aWNfd2dvbmdAcXVpY2luYy5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBXZW4gR29uZyA8
cXVpY193Z29uZ0BxdWljaW5jLmNvbT4KPj4gWy4uLl0KPj4KPj4+ICtzdHJ1Y3QgYXRoMTJrX2Z3
X3BkZXYgewo+Pj4gK8KgwqDCoCB1MzIgcGRldl9pZDsKPj4+ICvCoMKgwqAgdTMyIHBoeV9pZDsK
Pj4+ICvCoMKgwqAgdTMyIHN1cHBvcnRlZF9iYW5kczsKPj4+ICt9Owo+PiBTbyB3ZSBoYXZlIG5v
dyB0d28gdmVyeSBzaW1pbGFyIHN0cnVjdHVyZXMsIGF0aDEya19wZGV2IGFuZAo+PiBhdGgxMmtf
ZndfcGRldi4gSXQgd291bGQgYmUgZ29vZCB0byBkb2N1bWVudCBhYm92ZSB0aGUgc3RydWN0cyB0
aGVpcgo+PiBwdXJwb3NlLiBBbnkgaWRlYXMgd2hhdCBJIGNvdWxkIGFkZD8KPiAKPiBGb3Igc2lu
Z2xlX3BkZXYsIHRoZSBhdGgxMmtfcGRldiBpcyBhbHdheXMgb25lIHBkZXYuCj4gCj4gYW5kIGF0
aDEya19md19wZGV2IGlzIG1vcmUgdGhhbiBvbmUgZm9yIHNpbmdsZV9wZGV2Lgo+IAo+PgoKT2th
eSB3aWxsIGFkZCBhIGNvbW1lbnQgaW4gdGhlIG5leHQgdmVyc2lvbi4KCi0tIAphdGgxMmsgbWFp
bGluZyBsaXN0CmF0aDEya0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHBzOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEyawo=

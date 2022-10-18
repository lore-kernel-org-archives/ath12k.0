Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76115C4332F
	for <ath12k@archiver.kernel.org>; Tue, 18 Oct 2022 10:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXBlfsEs0g/ot6Hv862Dj+kN5SfXCUN/HMZO00SO5p4=; b=vP93ybbhv38lb8
	UpBv89lltUooIEv4Q73iBrA/aZjU3pKHGcqTaIhIQof2Gc2nc/k+7MQHKwLUbjwW6u1nPClI8L4r8
	jRvR2+086KtYqeTSSLyoOZd+Q64tWR4bqUYH0hEQMVy4HumbHyQspVZ/XtMkl/ojLrE0vAKmwg72G
	S9yDv9rj/2dzohJfwAOvUQydl02XI2tYaZpi1gDPamj+RDtK/GfLTr51gtxBikW4JtIF6O4jWfnGi
	HBbka/dUuCARlbk9VmFVAMP278Hp7nUgtFF0064t2CS+Iql8vq5Gf9BobJBpTXDfW+VMOrOtRgQYh
	9kTuqQQJP4eUzrj0nH/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjYS-005WoO-SP
	for ath12k@archiver.kernel.org; Tue, 18 Oct 2022 10:10:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjYP-005Wn3-E4; Tue, 18 Oct 2022 10:10:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29I7r2M7009310;
	Tue, 18 Oct 2022 10:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QHuIq1vgVmjuGXdr/qI9gfCBLvs4mMLFNVhWxyub4xo=;
 b=HsnigEyilReLPbEoMkRBlAnKI+7Dubmhwx39nIbrQAhvc2RghhGGL0E5gIi4vSpgE+kF
 oiP/ktuN1eO6E8K6umIczAwUGqaONcvEOzJyxg4YzWF8X9XFlLiPVg8DUjE8C4jF1Wdo
 SGM9mXANyetyPcuucYIg6v9Muk2Us85ahukUFS0P5mz9d8lKeDUxLqhA60njXHJJgCNX
 cGu7CNzEe29lzMJCwhWLdve6adEsDllqMFc85LZMjKf5har17i33l474yFQGkS9nawr/
 TRSJtRyZlt5kSIfBP7pbWRE1mv05RfkcDqDwN7b4lm1jVONar/V7AdwFMMvRnReBnBIJ kA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k9jjms5xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 10:10:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29IAAVn2015151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 10:10:31 GMT
Received: from [10.253.75.92] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 18 Oct
 2022 03:10:30 -0700
Message-ID: <95a1604c-f323-0fea-46a8-bf554da28fca@quicinc.com>
Date: Tue, 18 Oct 2022 18:10:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 01/15] mac80211: split bss_info_changed method
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
References: <20220601073958.8345-1-johannes@sipsolutions.net>
 <20220601093922.347d47c279fe.I15937cfe8405999084f164ddf57390f8b8d2bc61@changeid>
 <c38b4da8-488b-2d09-631a-1bb6c07440a6@quicinc.com>
 <3483d05c1d5a39b9243b54d9f28450344a897655.camel@sipsolutions.net>
 <bd6545a8-57a3-5849-52d5-c1a449ab1712@quicinc.com>
 <d0994456d3a9ea00b5cc472df7822d53d189399e.camel@sipsolutions.net>
 <7e72034a-497a-000c-d7bf-3ec974af9e1c@quicinc.com>
 <f210cf2a6e3f62156ae6a9d6c7de20e16bd4d6e6.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <f210cf2a6e3f62156ae6a9d6c7de20e16bd4d6e6.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3h-MauTJnnZfK5fVkQc8QiZ7JUaAFwbW
X-Proofpoint-ORIG-GUID: 3h-MauTJnnZfK5fVkQc8QiZ7JUaAFwbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_03,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 mlxlogscore=829 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210180058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_031033_500111_2F04F9CC 
X-CRM114-Status: GOOD (  11.12  )
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

T24gMTAvMTgvMjAyMiA1OjUxIFBNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+IE9uIFR1ZSwgMjAy
Mi0xMC0xOCBhdCAxNzo1MCArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4+PiBodHRwczovL3Auc2lw
c29sdXRpb25zLm5ldC8wNjUyYmJiYmUzNTBiMTI2LnR4dAo+PiBDb25mbGljdCBoYXBwZW5lZCB3
aGlsZSBydW4gImdpdCBhbSIgdGhlIHBhdGNoLgo+Pgo+PiBCZWNhdXNlIG1pc3NpbmcgdGhlwqAg
ImNoYW5nZWQgfD0gQlNTX0NIQU5HRURfRUhUX1BVTkNUVVJJTkc7IiBpbiBteQo+PiBsb2NhbCBj
b2RlLAo+Pgo+PiBhbHNvIGl0IGlzIG1pc3NpbmcgaW4KPj4gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvd2lyZWxlc3Mvd2lyZWxlc3MtbmV4dC5naXQvdHJl
ZS9uZXQvbWFjODAyMTEvdXRpbC5jCj4+Cj4+IE1heWJlICJjaGFuZ2VkIHw9IEJTU19DSEFOR0VE
X0VIVF9QVU5DVFVSSU5HOyIgaXMgb25seSBleGlzdGVkIGluIHlvdXIKPj4gbG9jYWwgY29kZT8K
Pj4KPiBBaCB5ZXMsIHdlIGRpZG4ndCB1cHN0cmVhbSB0aGF0IGJlY2F1c2UgdGhlcmUncyBzdGls
bCB0aGlzIGRpc2N1c3Npb24KPiBhYm91dCBoYW5kbGluZyBwdW5jdHVyaW5nLiBCdXQgeW91IGNh
biBwcm9iYWJseSBhcHBseSBhcm91bmQgdGhhdC4KPgo+IGpvaGFubmVzCgpZZXMsIGFmdGVyIGFw
cGx5IGl0LgoKYW5kIGFwcGx5ICJjb21taXQgM2Q5MDExMDI5MjI3MjNlZWRjZTZlZjEwZWJkMDMz
MTVhN2FiYjhhNSB3aWZpOiAKbWFjODAyMTE6IGltcGxlbWVudCBsaW5rIHN3aXRjaGluZyIgdG8K
CmZpeCBidWlsZCBlcnJvciBiZWNhdXNlIG15IGxvY2FsIGNvZGUgaXMgbm90IGxhdGVzdC4KCml0
IGlzIGJ1aWx0IHN1Y2Nlc3MsIEkgd2lsbCB0cnkgaXQgbGF0ZXIuCgoKLS0gCmF0aDEyayBtYWls
aW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==

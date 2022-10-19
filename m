Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8155C433FE
	for <ath12k@archiver.kernel.org>; Wed, 19 Oct 2022 04:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mkkpOlLyx0fKpiytB4IcDHI0S0bfzz4zig9jufO6Xuw=; b=kiOQcppbAkonNq
	BfwyUUX0uBof7qryPpGJGhrXjTzL0xyQKDYn8zYepoy8i6U8Der5CZjbkhi03Vy/rSvEYvKYByvxH
	pMAZopd8Cf3cdymC06dL4F4fH45qs9iA1HVnWWXcouG3Y67X879iA6oPQgFUg5l+xSqVJwfDXg4mD
	peNOADyyXASaHj0FugU3nknt+y/p+47IG/Swu0Kp23Z2TGSv/EN5xO6Lcgx+a7yoKknYShL/3tGz+
	29Ha1UIYoXyRSrErN84dcPP+TZUxX0IygOx0heSuDLlDjxWhyfID5F+rUcOilb7bHq1VDEr1qH5Lu
	8vYPXS3ai8L00aA0Dbgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol0l4-00Eh5c-U3
	for ath12k@archiver.kernel.org; Wed, 19 Oct 2022 04:32:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol0l0-00Egz0-Ts; Wed, 19 Oct 2022 04:32:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29J4LOBA011802;
	Wed, 19 Oct 2022 04:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IlrRhRmv95as1oiId1b1PHApl1MGh3RyfzRf2DVSV4Q=;
 b=H4q6AYfUmQE0UqNWnvImWE629DEk2RMnLvYUkn/L4MClvHg1wxPDGNDEHxz7zbxRB5D2
 6nQp5jWfh8wzupg8EKR/v3iJ9v2BCz/p8CYEdNUOSTpmijTRXu4tiZywcJyz1MYA2o8y
 NYmKj4FCAbtZ9M2daCxlbjGg5dk8K6sXLP4i+/ll5zxrJJdHlWaYQdlaJ/XzTYudYbkr
 IVUugGeLwsWdfrPka374tmEk1oJcRKXqfCXpJKy/DkueNMwWFxomX71WfDOXvFB7gNFO
 QjVY0NW6HY3cDSL8VMmwdtTUPYW9GZyvNRd1T5fLN2bSly+R5WC9bLVo+E0KsxxcLWJK 8A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k9yq1hg0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 04:32:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29J4WcdJ031790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 04:32:38 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 18 Oct
 2022 21:32:37 -0700
Message-ID: <92fc96e7-6305-ca2f-7f13-5d26d704c7f0@quicinc.com>
Date: Wed, 19 Oct 2022 12:32:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 01/15] mac80211: split bss_info_changed method
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
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
 <95a1604c-f323-0fea-46a8-bf554da28fca@quicinc.com>
In-Reply-To: <95a1604c-f323-0fea-46a8-bf554da28fca@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FcSl4CE342er6I5hcsvR87ljdseoEVFK
X-Proofpoint-GUID: FcSl4CE342er6I5hcsvR87ljdseoEVFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_01,2022-10-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 mlxlogscore=817 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_213243_229760_7D019D95 
X-CRM114-Status: GOOD (  13.45  )
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

T24gMTAvMTgvMjAyMiA2OjEwIFBNLCBXZW4gR29uZyB3cm90ZToKPiBPbiAxMC8xOC8yMDIyIDU6
NTEgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4+IE9uIFR1ZSwgMjAyMi0xMC0xOCBhdCAxNzo1
MCArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4+Pj4gaHR0cHM6Ly9wLnNpcHNvbHV0aW9ucy5uZXQv
MDY1MmJiYmJlMzUwYjEyNi50eHQKPj4+IENvbmZsaWN0IGhhcHBlbmVkIHdoaWxlIHJ1biAiZ2l0
IGFtIiB0aGUgcGF0Y2guCj4+Pgo+Pj4gQmVjYXVzZSBtaXNzaW5nIHRoZcKgICJjaGFuZ2VkIHw9
IEJTU19DSEFOR0VEX0VIVF9QVU5DVFVSSU5HOyIgaW4gbXkKPj4+IGxvY2FsIGNvZGUsCj4+Pgo+
Pj4gYWxzbyBpdCBpcyBtaXNzaW5nIGluCj4+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC93aXJlbGVzcy93aXJlbGVzcy1uZXh0LmdpdC90cmVlL25ldC9t
YWM4MDIxMS91dGlsLmMgCj4+Pgo+Pj4KPj4+IE1heWJlICJjaGFuZ2VkIHw9IEJTU19DSEFOR0VE
X0VIVF9QVU5DVFVSSU5HOyIgaXMgb25seSBleGlzdGVkIGluIHlvdXIKPj4+IGxvY2FsIGNvZGU/
Cj4+Pgo+PiBBaCB5ZXMsIHdlIGRpZG4ndCB1cHN0cmVhbSB0aGF0IGJlY2F1c2UgdGhlcmUncyBz
dGlsbCB0aGlzIGRpc2N1c3Npb24KPj4gYWJvdXQgaGFuZGxpbmcgcHVuY3R1cmluZy4gQnV0IHlv
dSBjYW4gcHJvYmFibHkgYXBwbHkgYXJvdW5kIHRoYXQuCj4+Cj4+IGpvaGFubmVzCj4KPiBZZXMs
IGFmdGVyIGFwcGx5IGl0Lgo+Cj4gYW5kIGFwcGx5ICJjb21taXQgM2Q5MDExMDI5MjI3MjNlZWRj
ZTZlZjEwZWJkMDMzMTVhN2FiYjhhNSB3aWZpOiAKPiBtYWM4MDIxMTogaW1wbGVtZW50IGxpbmsg
c3dpdGNoaW5nIiB0bwo+Cj4gZml4IGJ1aWxkIGVycm9yIGJlY2F1c2UgbXkgbG9jYWwgY29kZSBp
cyBub3QgbGF0ZXN0Lgo+Cj4gaXQgaXMgYnVpbHQgc3VjY2VzcywgSSB3aWxsIHRyeSBpdCBsYXRl
ci4KPgpIaSBqb2hhbm5lcywKCkFmdGVyIGFib3ZlIGNoYW5nZSwgbm8gZXJyb3Iva2VybmVsIGNy
YXNoIGhhcHBlbmVkIHdoaWxlIHJlY29uZmlnIHNpbmdsZSAKTUxPIGxpbmsgd2hpY2ggbGluayBp
ZCBpcyAyLgoKCi0tIAphdGgxMmsgbWFpbGluZyBsaXN0CmF0aDEya0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEyawo=

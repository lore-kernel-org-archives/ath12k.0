Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86784C4332F
	for <ath12k@archiver.kernel.org>; Thu, 15 Dec 2022 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e348hy2+gfP2aXYdpnXFZsRn/LI4ZjEMNN9OZFeFQJQ=; b=NvnqqE3NjT04dC
	dD/LJIQcLpMtLdRfvtAp/kiFWl0x98rYEobiVkFWO0QwgxX3nCa4tc7DUPmT/UUTZ4DwdvkZV2kdQ
	36hpWqo4XsGoIjVfnSD2W0EtIybBCmjqDJAKJ6hdTqWbz3QHRv+XaZ2ujwT76HD5ox0IImwQARewM
	hFW0aSwIrLnAiNYoYdntwYoM1rY07+8qzyrnhmqA1AL6rpG3dHHLcWAduvw1+p2PINbHlggEan3e0
	DveIqfbxsAS/kfBK3PaBBVpbCo6Dnj+l8Ci0ChfSANkXP8KNkTPc1pVfPBMJYJq2DOcSicTSG8aa8
	/qfN5QlM3j5+ddC3+DMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5pnG-009y8S-Uy
	for ath12k@archiver.kernel.org; Thu, 15 Dec 2022 15:05:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5pnD-009y4r-HW; Thu, 15 Dec 2022 15:05:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BFEm8Bf026894;
	Thu, 15 Dec 2022 15:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UpvWyTnElu3rN+4LGj/tlp+9gE7yWwfXwvYa0DMyft4=;
 b=om9vehMlSHMY1EsCU/NddVF5kvB0o0KpgBLE1wpAD2Jc/thovphibZUtMecceSBHFG8Y
 wZ0jd/0j3xXwtmox3ajWYEbnRBakyY2SQMfRsfOMdbs4Kl46Xpa2hsuPUwFrbsHBybqk
 Yu4lPbsodLgycP8tetiVmC9PdCWWSk4s4xqIT0gx34F/01Bc3IXGU3aLQrdrSKKLIA0f
 5D2E61Rtpp0vkbL8IQSZnY6NxearZMCem/AO7uMlZBV82ishWSV8FLLnH0AaSlU7e6BD
 Z03yWtw62DzTW6gXCjwUZtNRzOVEKlfvocZbFN+vPNZD7KW3atRuZS+25HZPTgT9P6Wo oQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mg06rsc17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Dec 2022 15:04:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BFF4vTo005476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Dec 2022 15:04:57 GMT
Received: from [10.253.8.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 15 Dec
 2022 07:04:56 -0800
Message-ID: <03e1625e-8989-c465-754b-de3d4b466c58@quicinc.com>
Date: Thu, 15 Dec 2022 23:04:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
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
 <92fc96e7-6305-ca2f-7f13-5d26d704c7f0@quicinc.com>
In-Reply-To: <92fc96e7-6305-ca2f-7f13-5d26d704c7f0@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Kt7vp0A6o8yX3HxFLE94l2zqCmLeW5aa
X-Proofpoint-ORIG-GUID: Kt7vp0A6o8yX3HxFLE94l2zqCmLeW5aa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_08,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=783 clxscore=1011
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_070503_610225_9C8D802C 
X-CRM114-Status: GOOD (  12.28  )
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

T24gMTAvMTkvMjAyMiAxMjozMiBQTSwgV2VuIEdvbmcgd3JvdGU6Cj4gT24gMTAvMTgvMjAyMiA2
OjEwIFBNLCBXZW4gR29uZyB3cm90ZToKPj4gT24gMTAvMTgvMjAyMiA1OjUxIFBNLCBKb2hhbm5l
cyBCZXJnIHdyb3RlOgo+Pj4gT24gVHVlLCAyMDIyLTEwLTE4IGF0IDE3OjUwICswODAwLCBXZW4g
R29uZyB3cm90ZToKPj4+Pj4gaHR0cHM6Ly9wLnNpcHNvbHV0aW9ucy5uZXQvMDY1MmJiYmJlMzUw
YjEyNi50eHQKPj4+PiBDb25mbGljdCBoYXBwZW5lZCB3aGlsZSBydW4gImdpdCBhbSIgdGhlIHBh
dGNoLgo+Pj4+Cj4+Pj4gQmVjYXVzZSBtaXNzaW5nIHRoZcKgICJjaGFuZ2VkIHw9IEJTU19DSEFO
R0VEX0VIVF9QVU5DVFVSSU5HOyIgaW4gbXkKPj4+PiBsb2NhbCBjb2RlLAo+Pj4+Cj4+Pj4gYWxz
byBpdCBpcyBtaXNzaW5nIGluCj4+Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvd2lyZWxlc3Mvd2lyZWxlc3MtbmV4dC5naXQvdHJlZS9uZXQvbWFjODAy
MTEvdXRpbC5jIAo+Pj4+Cj4+Pj4KPj4+PiBNYXliZSAiY2hhbmdlZCB8PSBCU1NfQ0hBTkdFRF9F
SFRfUFVOQ1RVUklORzsiIGlzIG9ubHkgZXhpc3RlZCBpbiB5b3VyCj4+Pj4gbG9jYWwgY29kZT8K
Pj4+Pgo+Pj4gQWggeWVzLCB3ZSBkaWRuJ3QgdXBzdHJlYW0gdGhhdCBiZWNhdXNlIHRoZXJlJ3Mg
c3RpbGwgdGhpcyBkaXNjdXNzaW9uCj4+PiBhYm91dCBoYW5kbGluZyBwdW5jdHVyaW5nLiBCdXQg
eW91IGNhbiBwcm9iYWJseSBhcHBseSBhcm91bmQgdGhhdC4KPj4+Cj4+PiBqb2hhbm5lcwo+Pgo+
PiBZZXMsIGFmdGVyIGFwcGx5IGl0Lgo+Pgo+PiBhbmQgYXBwbHkgImNvbW1pdCAzZDkwMTEwMjky
MjcyM2VlZGNlNmVmMTBlYmQwMzMxNWE3YWJiOGE1IHdpZmk6IAo+PiBtYWM4MDIxMTogaW1wbGVt
ZW50IGxpbmsgc3dpdGNoaW5nIiB0bwo+Pgo+PiBmaXggYnVpbGQgZXJyb3IgYmVjYXVzZSBteSBs
b2NhbCBjb2RlIGlzIG5vdCBsYXRlc3QuCj4+Cj4+IGl0IGlzIGJ1aWx0IHN1Y2Nlc3MsIEkgd2ls
bCB0cnkgaXQgbGF0ZXIuCj4+Cj4gSGkgam9oYW5uZXMsCj4KPiBBZnRlciBhYm92ZSBjaGFuZ2Us
IG5vIGVycm9yL2tlcm5lbCBjcmFzaCBoYXBwZW5lZCB3aGlsZSByZWNvbmZpZyAKPiBzaW5nbGUg
TUxPIGxpbmsgd2hpY2ggbGluayBpZCBpcyAyLgoKSGkgSm9oYW5uZXMsCgpJIHNlZSB0aGlzIHBh
dGNoIGh0dHBzOi8vcC5zaXBzb2x1dGlvbnMubmV0LzA2NTJiYmJiZTM1MGIxMjYudHh0IGlzIG5v
dCAKbWVyZ2VkIHRvIApodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC93aXJlbGVzcy93aXJlbGVzcy1uZXh0LmdpdC90cmVlL25ldC9tYWM4MDIxMS91dGlsLmMK
CndpbGwgeW91ciBtZXJnZSBpdCBsYXRlcj8KCgoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRo
MTJrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTJrCg==

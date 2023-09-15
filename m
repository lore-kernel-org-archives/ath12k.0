Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7478EE6449
	for <ath12k@archiver.kernel.org>; Fri, 15 Sep 2023 08:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fI5hsk3GhYpA6Z304if8+eBHbUnQWSZRLJ4WEXPyrJg=; b=g/ezakRDXMoqFq
	IVM/1u1l3JmO6gEpjhfpRY01hJDXHWmW0oWyah+XNhCO0ve7KljlskAnGvYSQK758/W1xw3ovB1a4
	jhiF4ti63vtg3BnRh1vleA5aq3wRyXcg806dyCQwBC/gZTOlJL4GtR3ixfRpTE9NAxM1wZQ5Zhec4
	3dk28KH9u9EAB4xgkA7ePOxa4JChB2HBImTsyLz6TeLUqRcRMEktif58JtIc7UO2zeDSwSjkj1Pv0
	oqT9qjy8Wwx1mlI81oXjWboXBlKHnB3ruNF60QcxpQLWiYVyY2Qe5DrSwlIQAKoa8p9x0LEdm/Ds0
	tD9MqnghcG8gyQNpWgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4Qo-00AAjf-1q
	for ath12k@archiver.kernel.org;
	Fri, 15 Sep 2023 08:44:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4Ql-00AAjD-2a
	for ath12k@lists.infradead.org;
	Fri, 15 Sep 2023 08:44:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38F7nGij008297;
	Fri, 15 Sep 2023 08:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EN0iKJSDkDV2U04k+3tw2wCh4hoqZXBv0iTXm4rec1U=;
 b=GIsIsQf1Xua8EkOODQK8PUyfG2jWyXtp+vziUW9tsCAeR6ClZCW6TgRQ/yjxFvnk+vC7
 1IBW2s88UJD9QQWvlAUAeyd84AKlFcKHvmDLljfpPyL+bU+3KcRO2r+1+Yyw6f74rMWn
 Eu3670qyDRFKBzee/TWQ2gWXNy+NW9iQM6aYTBaGBBe8JuBgjGgtBu6RDMh4LDZDMWzY
 ghC1xvk59Ou540kzN69sLC9jWExSzxP+lx3aViP7OcwMhMd7yLcL3+b43V7V8rB8SBXe
 pswnEElyJWD8tTLGlbIQ54hq1xP2dUytft/cnuFXqFfmQhaL+LR2v2q3dLhQNjNBShXH ow== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g5tgg9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 08:44:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38F8i19L026561
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 08:44:01 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 01:44:00 -0700
Message-ID: <bfdcbf9a-0b27-1f7e-3eca-7390a9a7404e@quicinc.com>
Date: Fri, 15 Sep 2023 16:43:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/3] wifi: mac80211: update link RX NSS by
 ieee80211_sta_set_rx_nss() in ieee80211_assoc_config_link()
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230906103458.24092-1-quic_wgong@quicinc.com>
 <20230906103458.24092-4-quic_wgong@quicinc.com>
 <e6ea3009c489fae910adbf2e1c766f2d827f287f.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <e6ea3009c489fae910adbf2e1c766f2d827f287f.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: plgS4T18f3K-nB8dR6qCyiBnIn6qxIdb
X-Proofpoint-GUID: plgS4T18f3K-nB8dR6qCyiBnIn6qxIdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_05,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_014403_952111_CD785BC9 
X-CRM114-Status: GOOD (  14.78  )
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

T24gOS8xMy8yMDIzIDU6MDQgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gV2VkLCAyMDIz
LTA5LTA2IGF0IDA2OjM0IC0wNDAwLCBXZW4gR29uZyB3cm90ZToKPj4gQ3VycmVudGx5IGZvciBN
TE8gY29ubmVjdGlvbiwgb25seSBkZWZsaW5rJ3MgcnhfbnNzIGlzIHNldCB0byBjb3JyZWN0Cj4+
IHZhbHVlLiBUaGUgb3RoZXJzIGxpbmtzJyByeF9uc3Mgb2Ygc3RydWN0IGllZWU4MDIxMV9saW5r
X3N0YSBpcwo+PiB2YWx1ZSAwIGluIGllZWU4MDIxMV9zZXRfYXNzb2NpYXRlZCgpLCBiZWNhdXNl
IHRoZXkgYXJlIG5vdCBwYXNzIGludG8KPj4gaWVlZTgwMjExX3N0YV9zZXRfcnhfbnNzKCkgaW4g
bWFjODAyMTEgZXhjZXB0IHRoZSBkZWZsaW5rIGluCj4+IHJhdGVfY29udHJvbF9yYXRlX2luaXQo
KS4gVGhpcyBsZWFkcyBkcml2ZXIgZ2V0IE5TUyA9IDAgZm9yIG90aGVyIGxpbmtzLgo+PiBBZGQg
dGhlIGllZWU4MDIxMV9zdGFfc2V0X3J4X25zcygpIGluIGllZWU4MDIxMV9hc3NvY19jb25maWdf
bGluaygpLAo+PiB0aGVuIHRoZSBvdGhlciBsaW5rcycgcnhfbnNzIHdpbGwgYmUgc2V0IHRvIHRo
ZSBjb3JyZWN0IHZhbHVlLgo+IFRoaXMgaXMgcHJldHR5IG11Y2ggdHJ1ZSwgYnV0IEkgYWxzbyB0
aGluayBpdCdzIHByb2JsZW1hdGljIHRoZSB3YXkgeW91Cj4gcGhyYXNlIGl0LiBTb2Z0d2FyZSBy
YXRlIGNvbnRyb2wgaXMgcHJldHR5IG11Y2gsIGF0IGxlYXN0IGN1cnJlbnRseSwKPiBfbm90XyBz
dXBwb3J0ZWQgZm9yIE1MTyAoYW5kIEkgZG9uJ3QgcmVhbGx5IHNlZSBob3cgdG8gc3VwcG9ydCBp
dCwgaWYKPiBmaXJtd2FyZSBwaWNrcyB0aGUgbGluayB0byB0cmFuc21pdCBvbiwgYXMgaXQgcHJv
YmFibHkgc2hvdWxkKS4KSSBzZWFyY2hlZCBhbGwgdGhlIGZvbGRlciB3aXJlbGVzcywgSSBvbmx5
IGZvdW5kIDUgcGxhY2VzIGhhdmUgdGhlIApoYW5kbGVyIG9mIHJhdGVfaW5pdCBiZWxvdywKYW5k
IHRoZSBmdW5jdGlvbnMgYXJlIGFsbCBlbXB0eS4gSXMgaXQgbWVhbnMgbm8gZHJpdmVyIHN1cHBv
cnQgcmF0ZV9pbml0IApjdXJyZW50bHk/CmRyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRs
d2lmaS9yYy5jOjMwNDrCoMKgwqDCoCAucmF0ZV9pbml0ID0gCnJ0bF9yYXRlX2luaXQsCmRyaXZl
cnMvbmV0L3dpcmVsZXNzL2ludGVsL2l3bHdpZmkvbXZtL3JzLmM6NDA5ODrCoCAucmF0ZV9pbml0
ID0gCnJzX3JhdGVfaW5pdF9vcHMsCmRyaXZlcnMvbmV0L3dpcmVsZXNzL2ludGVsL2l3bHdpZmkv
ZHZtL3JzLmM6MzI3NjrCoCAucmF0ZV9pbml0ID0gCnJzX3JhdGVfaW5pdF9zdHViLApkcml2ZXJz
L25ldC93aXJlbGVzcy9pbnRlbC9pd2xlZ2FjeS80OTY1LXJzLmM6Mjc3OTogLnJhdGVfaW5pdCA9
IAppbDQ5NjVfcnNfcmF0ZV9pbml0X3N0dWIsCmRyaXZlcnMvbmV0L3dpcmVsZXNzL2ludGVsL2l3
bGVnYWN5LzM5NDUtcnMuYzo4Njc6IC5yYXRlX2luaXQgPSAKaWwzOTQ1X3JzX3JhdGVfaW5pdF9z
dHViLApbLi4uXQoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJr
Cg==

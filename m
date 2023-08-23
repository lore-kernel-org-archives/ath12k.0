Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC06EE49A3
	for <ath12k@archiver.kernel.org>; Wed, 23 Aug 2023 02:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YmprVMtZZgZhoBHiy0OusM1UI5uSoqlN9uql47V8rVA=; b=w2zsY8QyryEhkW
	4CJnSit+HXw872Isx/pLZ0IJuKrLOk74n1bvo8Zf2HYJY8U2F4eaRIX9GEsTKdD95GR68fZpT0q/x
	WKM/3ZY+2iLVZpjhY8HbnKh9vbUlhJvGkOIye5hICmG5hdj5n+O7pOyJr9Ks8mgrtHi5RV4g3kJO4
	nljZW2RsCdNGwxaCZG3+zaS2gVeWEVIdBc4AGSppX/DG2g29dg69x1k4kWoIglA43kOdPflXZJrk6
	1KYT22tfoEsY/RLrFesMbjBZF2QyR8/N0m63GziG2wQfj3MaecGe7uT7M+49gSniRy9LbUQT2wTVZ
	OvKBTKioJt+/DUDXOI5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYdbd-00H5C7-1u
	for ath12k@archiver.kernel.org;
	Wed, 23 Aug 2023 02:28:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYdba-00H5Bo-0Z
	for ath12k@lists.infradead.org;
	Wed, 23 Aug 2023 02:28:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37N1M2pB021157;
	Wed, 23 Aug 2023 02:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=D4NMvvlBpSBphEdziYMcFX8py+7jy58aV7F0y9CBTWw=;
 b=SAlQVrIIX2P+qzeipF+S6Uf//uQtW6O8WSYKeRI/9nLD2giPKJE/y5KDNkQcJ/wO1L9m
 JZdCBjZieeKH36Ntyr1Yl5cP2fZhEcs2UUKCykZboMajefeZ4NQVjryqE0aGpgsEPyHa
 GVNvQvhEynj/vwmIutjFeu0ibTlsJXWscgTQU91oPxnJ2kHFr6z72lSyAO72bC96a6na
 6OktunJWgKcSjNJDlLKvUGXsLu5ZEvtlTeBkOf6tLymZep9ylF2LWSEkc2pbnlY+AUya
 DaoWRM2pQglVk4zFtuUaZvIiUtpdjChNuDImw/Tq5X/mjSuVoc9AAq6YmeqWKM0Lo+ps xA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sn26sgtuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 02:28:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37N2SHA9004645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 02:28:17 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 22 Aug
 2023 19:28:16 -0700
Message-ID: <bcf65017-0dbc-e957-f382-98c6dc406346@quicinc.com>
Date: Wed, 23 Aug 2023 10:28:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] wifi: mac80211: fix cfg80211_bss always hold when
 assoc response fail for MLO connection
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230822100409.1242-1-quic_wgong@quicinc.com>
 <c4d2c8987f929f29da96154e0fc6c9e94882310e.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <c4d2c8987f929f29da96154e0fc6c9e94882310e.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RdsGoLIhFvaNsqfjkRcpWKboCvMlulGe
X-Proofpoint-GUID: RdsGoLIhFvaNsqfjkRcpWKboCvMlulGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_22,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=946 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308230021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_192822_244089_C422FAB6 
X-CRM114-Status: GOOD (  19.07  )
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

T24gOC8yMi8yMDIzIDc6MTYgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gVHVlLCAyMDIz
LTA4LTIyIGF0IDA2OjA0IC0wNDAwLCBXZW4gR29uZyB3cm90ZToKPj4gSXQgaXMgMTAwJSByYXRp
byB0byByZXByb2R1Y2UgdGhlIGlzc3VlIHdpdGggdGhpcyBjaGFuZ2UuCj4+IEFkZCAibWdtdC0+
dS5hc3NvY19yZXNwLnN0YXR1c19jb2RlID0gMSIgaW4gaWVlZTgwMjExX3J4X21nbXRfYXNzb2Nf
cmVzcCgpLgo+IERvbid0IHRoaW5rIHRoYXQgYWRkcyBhbnkgdmFsdWUsIGJ1dCBJIGd1ZXNzIEkg
Y2FuIGFsd2F5cyByZW1vdmUgaXQuCgpjaGFuZ2UgdGhlICJtZ210LT51LmFzc29jX3Jlc3Auc3Rh
dHVzX2NvZGUgPSAxIiBpcyBvbmx5IGEgd2F5IHRvIApyZXByb2R1Y2UgdGhlIGJzcyBob2xkCgpp
c3N1ZS4geW91IGNhbiByZW1vdmUgaXQgd2hlbiB1cHN0cmVhbSB0aGlzIHBhdGNoLvCfmIEKCj4K
Pj4gKwkJLyogdXNlIHRoZSBhZGRyIG9mIGFzc29jX2RhdGEgbGluayB3aGljaCBpcyBzZXQgaW4g
aWVlZTgwMjExX21nZF9hc3NvYygpICovCj4gbm90IHN1cmUgdGhhdCdzIHNvIHVzZWZ1bD8gYnV0
IGFueXdheQo+Cj4gVGhlIHJlYXNvbiBJJ20gZXZlbiB3cml0aW5nIHRoaXMgbWVzc2FnZSBpcyB0
aGF0IHlvdSBkaWRuJ3QgdGhpbmsgdGhpcwo+IGNoYW5nZSB0aHJvdWdoOgpZZXMsIHlvdSBjYW4g
cmVtb3ZlIHRoZSBjb21tZW50IHdoZW4gdXBzdHJlYW0gdGhpcyBwYXRjaC4KPj4gLQkJY29uc3Qg
dTggKmFkZHI7Cj4+ICsJCXU4IGFkZHJbRVRIX0FMRU5dIF9fYWxpZ25lZCgyKTsKPiBUaGF0IGhh
cyBzb21lIG90aGVyIGNvbnNlcXVlbmNlcyB5b3UgbmVlZCB0byBhZGFwdCB0bywgaW4gcGFydGlj
dWxhcgo+Cj4gICAgICAgICAgICAgICAgICAvKiBuZWVkIHRvIGhhdmUgbG9jYWwgbGluayBhZGRy
ZXNzZXMgZm9yIE1MTyBjb25uZWN0aW9ucyAqLwo+Cj4gICAgICAgICAgICAgICAgICBXQVJOX09O
KGNyLmFwX21sZF9hZGRyICYmICFjci5saW5rc1tsaW5rX2lkXS5hZGRyKTsKPgo+IG1ha2VzIG5v
IHNlbnNlIGFueW1vcmUuIE5vdCBzdXJlIGlmIHRoYXQncyB0aGUgb25seSBvbmUuCgpBZnRlciB0
aGlzIHBhdGNoLCB0aGUgY3IubGlua3NbbGlua19pZF0uYWRkciB3aWxsIGJlIGEgdmFsaWQgbG9j
YWwgbGluayAKYWRkcmVzcyBmcm9tCgpzdHJ1Y3QgY2ZnODAyMTFfcnhfYXNzb2NfcmVzcCwgc28g
SSB0aGluayBpdCBpcyBub3QgbmVlZGVkIHJlbW92ZSBub3cuCgoKQW5vdGhlciBpcyBoZXJlIGlu
IF9fY2ZnODAyMTFfY29ubmVjdF9yZXN1bHQoKToKCiDCoMKgIMKgwqDCoMKgIGZvcl9lYWNoX3Zh
bGlkX2xpbmsoY3IsIGxpbmspIHsKIMKgwqAgwqDCoMKgwqAgwqDCoMKgIGlmIChXQVJOX09OKCFj
ci0+bGlua3NbbGlua10uYWRkcikpCiDCoMKgIMKgwqDCoMKgIMKgwqDCoCDCoMKgwqAgZ290byBv
dXQ7Cgo+Cj4KPiBqb2hhbm5lcwoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTJrCg==

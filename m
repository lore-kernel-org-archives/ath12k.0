Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AD3C6FD1C
	for <ath12k@archiver.kernel.org>; Sat, 25 Mar 2023 14:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oK0hFidJHC1QHJYFJUjqkqcVasfsnQM5OcEBE4jvf4Y=; b=sf8dmM02fytDY8
	ku9u91cnWl+9KFB6PWnIYgOVPRe5hU8ygmKdMOuehOOcF82qEfIBQFqejmBYqUyLnyt64vnCyO9lZ
	B7Ac86SYVA+kaonp6lMXR6sYd/QItzUj0eWO60AkCNrP6r3roDY8rP6DGRDS3sWVIhBDu85vXmX/n
	sY86W/kP0+ZVnDiVUmU0Z2/6lg3s6B8jMTIopUS8akPB7/McAoBq5dyGdC8BA/Ol11pYnjNDpYDob
	rhpqy55bm/EZ+24Dnfa89mk/QokDTdDdohTbHrpZofMjlwwzKTdh7/Harb1MXzv8PYT2pHH71xsOj
	+sSxzfS86N3AUxgNed7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg4y3-006qaT-33
	for ath12k@archiver.kernel.org;
	Sat, 25 Mar 2023 14:34:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pg4y0-006qYG-0S;
	Sat, 25 Mar 2023 14:34:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32PEB3ri021076;
	Sat, 25 Mar 2023 14:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WASG4cmFJyzzNH4fhRfxhgn8SsEhYoYGlby18+FOxCI=;
 b=h9GDRWDRb6BURjljVyV8KHlbcF3rXS7DQXO7Pi1C798LyWR/PmdscQDfmkcyYHJEpuCh
 UtPs1Cb5fZybflJzZ5AcsEM1fd89TTMDwRzED4qBlELrM/z1MBnF+7p45htof5+eR6jQ
 AAI1PbV0i8SKTX2TlzN73H/vQ/TKB4cZAMp+flrEgYriQPtyiB+kAZoHduPjNkzdNuGs
 SHobab7Olxael9qbP2hkjgFFH7VcqfjRORLtaRJur3ld4862AHxbA3+nHEx179CB9bne
 HbTse5vVw1b8QGneZJ66kY4sn9btBROJiTY9LaLEJGzwMMfP82trKBMoAO9mEXreDMJr lQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3phsvj0rwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Mar 2023 14:33:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32PEXm0Z001104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Mar 2023 14:33:48 GMT
Received: from [10.253.37.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Sat, 25 Mar
 2023 07:33:46 -0700
Message-ID: <ca5177fe-3b9f-2309-9afd-1d5e827540f7@quicinc.com>
Date: Sat, 25 Mar 2023 22:33:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 24/27] wifi: mac80211: implement link switching
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes.berg@intel.com>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <quic_wgong@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.d99dfbe65c90.I92385ba882ec984a9a2ad18293173436657e82aa@changeid>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20220902161143.d99dfbe65c90.I92385ba882ec984a9a2ad18293173436657e82aa@changeid>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fsRLthm7BdeFa06CMS4v0TiAMJVzncqv
X-Proofpoint-ORIG-GUID: fsRLthm7BdeFa06CMS4v0TiAMJVzncqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303250120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_073400_320709_245901E0 
X-CRM114-Status: GOOD (  25.32  )
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

T24gOS8yLzIwMjIgMTA6MTIgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gRnJvbTogSm9oYW5u
ZXMgQmVyZyA8am9oYW5uZXMuYmVyZ0BpbnRlbC5jb20+Cj4KPiBJbXBsZW1lbnQgYW4gQVBJIGZ1
bmN0aW9uIGFuZCBkZWJ1Z2ZzIGZpbGUgdG8gc3dpdGNoCj4gYWN0aXZlIGxpbmtzLgo+Cj4gQWxz
byBwcm92aWRlIGFuIGFzeW5jIHZlcnNpb24gb2YgdGhlIEFQSSBzbyBkcml2ZXJzCj4gY2FuIGNh
bGwgaXQgaW4gYXJiaXRyYXJ5IGNvbnRleHRzLCBlLmcuIHdoaWxlIGluIHRoZQo+IGF1dGhvcml6
ZWQgY2FsbGJhY2suCj4KPiBTaWduZWQtb2ZmLWJ5OiBKb2hhbm5lcyBCZXJnIDxqb2hhbm5lcy5i
ZXJnQGludGVsLmNvbT4KPiAtLS0KPiAgIGluY2x1ZGUvbmV0L21hYzgwMjExLmggICAgICAgIHwg
IDQxICsrKysrKysrCj4gICBuZXQvbWFjODAyMTEvZGVidWdmc19uZXRkZXYuYyB8ICAyNiArKysr
KysKPiAgIG5ldC9tYWM4MDIxMS9pZWVlODAyMTFfaS5oICAgIHwgICA0ICsKPiAgIG5ldC9tYWM4
MDIxMS9pZmFjZS5jICAgICAgICAgIHwgIDEyICsrKwo+ICAgbmV0L21hYzgwMjExL2tleS5jICAg
ICAgICAgICAgfCAgMzQgKysrKysrKwo+ICAgbmV0L21hYzgwMjExL2tleS5oICAgICAgICAgICAg
fCAgIDMgKwo+ICAgbmV0L21hYzgwMjExL2xpbmsuYyAgICAgICAgICAgfCAxNzEgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgNyBmaWxlcyBjaGFuZ2VkLCAyOTEgaW5zZXJ0
aW9ucygrKQo+Cj4gLi4uCj4gK3N0YXRpYyBpbnQgX2llZWU4MDIxMV9zZXRfYWN0aXZlX2xpbmtz
KHN0cnVjdCBpZWVlODAyMTFfc3ViX2lmX2RhdGEgKnNkYXRhLAo+ICsJCQkJICAgICAgIHUxNiBh
Y3RpdmVfbGlua3MpCj4gK3sKPiArCXN0cnVjdCBpZWVlODAyMTFfYnNzX2NvbmYgKmxpbmtfY29u
ZnNbSUVFRTgwMjExX01MRF9NQVhfTlVNX0xJTktTXTsKPiArCXN0cnVjdCBpZWVlODAyMTFfbG9j
YWwgKmxvY2FsID0gc2RhdGEtPmxvY2FsOwo+ICsJdTE2IG9sZF9hY3RpdmUgPSBzZGF0YS0+dmlm
LmFjdGl2ZV9saW5rczsKPiArCXVuc2lnbmVkIGxvbmcgcmVtID0gb2xkX2FjdGl2ZSAmIH5hY3Rp
dmVfbGlua3M7Cj4gKwl1bnNpZ25lZCBsb25nIGFkZCA9IGFjdGl2ZV9saW5rcyAmIH5vbGRfYWN0
aXZlOwo+ICsJc3RydWN0IHN0YV9pbmZvICpzdGE7Cj4gKwl1bnNpZ25lZCBpbnQgbGlua19pZDsK
PiArCWludCByZXQsIGk7Cj4gKwo+ICsJaWYgKCFpZWVlODAyMTFfc2RhdGFfcnVubmluZyhzZGF0
YSkpCj4gKwkJcmV0dXJuIC1FTkVURE9XTjsKPiArCj4gKwlpZiAoc2RhdGEtPnZpZi50eXBlICE9
IE5MODAyMTFfSUZUWVBFX1NUQVRJT04pCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsJLyog
Y2Fubm90IGFjdGl2YXRlIGxpbmtzIHRoYXQgZG9uJ3QgZXhpc3QgKi8KPiArCWlmIChhY3RpdmVf
bGlua3MgJiB+c2RhdGEtPnZpZi52YWxpZF9saW5rcykKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiAr
Cj4gKwkvKiBub3RoaW5nIHRvIGRvICovCj4gKwlpZiAob2xkX2FjdGl2ZSA9PSBhY3RpdmVfbGlu
a3MpCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IElFRUU4MDIxMV9NTERf
TUFYX05VTV9MSU5LUzsgaSsrKQo+ICsJCWxpbmtfY29uZnNbaV0gPSBzZGF0YV9kZXJlZmVyZW5j
ZShzZGF0YS0+dmlmLmxpbmtfY29uZltpXSwKPiArCQkJCQkJICBzZGF0YSk7Cj4gKwo+ICsJaWYg
KGFkZCkgewo+ICsJCXNkYXRhLT52aWYuYWN0aXZlX2xpbmtzIHw9IGFjdGl2ZV9saW5rczsKPiAr
CQlyZXQgPSBkcnZfY2hhbmdlX3ZpZl9saW5rcyhsb2NhbCwgc2RhdGEsCj4gKwkJCQkJICAgb2xk
X2FjdGl2ZSwKPiArCQkJCQkgICBzZGF0YS0+dmlmLmFjdGl2ZV9saW5rcywKPiArCQkJCQkgICBs
aW5rX2NvbmZzKTsKPiArCQlpZiAocmV0KSB7Cj4gKwkJCXNkYXRhLT52aWYuYWN0aXZlX2xpbmtz
ID0gb2xkX2FjdGl2ZTsKPiArCQkJcmV0dXJuIHJldDsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJZm9y
X2VhY2hfc2V0X2JpdChsaW5rX2lkLCAmcmVtLCBJRUVFODAyMTFfTUxEX01BWF9OVU1fTElOS1Mp
IHsKPiArCQlzdHJ1Y3QgaWVlZTgwMjExX2xpbmtfZGF0YSAqbGluazsKPiArCj4gKwkJbGluayA9
IHNkYXRhX2RlcmVmZXJlbmNlKHNkYXRhLT5saW5rW2xpbmtfaWRdLCBzZGF0YSk7Cj4gKwo+ICsJ
CS8qIEZJWE1FOiBraWxsIFRETFMgY29ubmVjdGlvbnMgb24gdGhlIGxpbmsgKi8KPiArCj4gKwkJ
aWVlZTgwMjExX2xpbmtfcmVsZWFzZV9jaGFubmVsKGxpbmspOwo+ICsJfQo+ICsKPiArCWxpc3Rf
Zm9yX2VhY2hfZW50cnkoc3RhLCAmbG9jYWwtPnN0YV9saXN0LCBsaXN0KSB7Cj4gKwkJaWYgKHNk
YXRhICE9IHN0YS0+c2RhdGEpCj4gKwkJCWNvbnRpbnVlOwo+ICsJCXJldCA9IGRydl9jaGFuZ2Vf
c3RhX2xpbmtzKGxvY2FsLCBzZGF0YSwgJnN0YS0+c3RhLAo+ICsJCQkJCSAgIG9sZF9hY3RpdmUs
Cj4gKwkJCQkJICAgb2xkX2FjdGl2ZSB8IGFjdGl2ZV9saW5rcyk7Cj4gKwkJV0FSTl9PTl9PTkNF
KHJldCk7Cj4gKwl9Cj4gKwo+ICsJcmV0ID0gaWVlZTgwMjExX2tleV9zd2l0Y2hfbGlua3Moc2Rh
dGEsIHJlbSwgYWRkKTsKCkkgc2VlIGllZWU4MDIxMV9rZXlfc3dpdGNoX2xpbmsoKSBvbmx5IGhh
bmRsZXIgdGhlIHBlci1saW5rKGxpbmtfaWQgPj0gCjApIGtleXMsCgpTbyBJIHRoaW5rIGxvd2Vy
IGRyaXZlciBhbHNvIGluc3RhbGwgdGhlIHBhaXJ3aXNlIGtleXMobGlua19pZCA9IC0xKSBmb3Ig
CnRoZSBhZGRlZCBsaW5rcyBhdCB0aGlzIG1vbWVudD8KCj4gKwlXQVJOX09OX09OQ0UocmV0KTsK
PiArCj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KHN0YSwgJmxvY2FsLT5zdGFfbGlzdCwgbGlzdCkg
ewo+ICsJCWlmIChzZGF0YSAhPSBzdGEtPnNkYXRhKQo+ICsJCQljb250aW51ZTsKPiArCQlyZXQg
PSBkcnZfY2hhbmdlX3N0YV9saW5rcyhsb2NhbCwgc2RhdGEsICZzdGEtPnN0YSwKPiArCQkJCQkg
ICBvbGRfYWN0aXZlIHwgYWN0aXZlX2xpbmtzLAo+ICsJCQkJCSAgIGFjdGl2ZV9saW5rcyk7Cj4g
KwkJV0FSTl9PTl9PTkNFKHJldCk7Cj4gKwl9Cj4gKwoKSSBzZWUgMiB0aW1lcyB0byBjYWxsIGRy
dl9jaGFuZ2Vfc3RhX2xpbmsoKSBhYm92ZSwgYW5kIHdpdGggc2VxdWVuY2XCoCAKb2xkX2FjdGl2
ZS0+b2xkX2FjdGl2ZSB8IGFjdGl2ZV9saW5rcy0+YWN0aXZlX2xpbmtzCgpNYXkgSSBrbm93IGlz
IGl0IGhhcyBzb21lIGRlc2lnbiBoZXJlPwoKPiArCWZvcl9lYWNoX3NldF9iaXQobGlua19pZCwg
JmFkZCwgSUVFRTgwMjExX01MRF9NQVhfTlVNX0xJTktTKSB7Cj4gKwkJc3RydWN0IGllZWU4MDIx
MV9saW5rX2RhdGEgKmxpbms7Cj4gKwo+ICsJCWxpbmsgPSBzZGF0YV9kZXJlZmVyZW5jZShzZGF0
YS0+bGlua1tsaW5rX2lkXSwgc2RhdGEpOwo+ICsKPiArCQlyZXQgPSBpZWVlODAyMTFfbGlua191
c2VfY2hhbm5lbChsaW5rLCAmbGluay0+Y29uZi0+Y2hhbmRlZiwKPiArCQkJCQkJIElFRUU4MDIx
MV9DSEFOQ1RYX1NIQVJFRCk7CgpGb3IgdGhlIDFzdCBsaW5rIG9mIE1MTyBjb25uZWN0aW9uL05P
Ti1NTE8gY29ubmV0aW9uLCBpZWVlODAyMTFfbGlua191c2VfY2hhbm5lbCgpIGlzIGNhbGxlZCBi
ZWZvcmUgZHJ2X2NoYW5nZV9zdGFfbGluaygpLApBbmQgbm93IGl0IGlzIGFmdGVyIGRydl9jaGFu
Z2Vfc3RhX2xpbmsoKSwgTWF5IEkga25vdyBpcyBpdCBhbHNvIGhhcyBzb21lIGRlc2lnbiBoZXJl
PwoKQWxzbyBJIHNlZSBjb21taXQoOGZiN2UyZWY0YmFiIG1hYzgwMjExX2h3c2ltOiBhbHdheXMg
YWN0aXZhdGUgYWxsIGxpbmtzKSBhbmQgaWVlZTgwMjExX2lmX3BhcnNlX2FjdGl2ZV9saW5rcygp
CndpbGwgdXNlIGllZWU4MDIxMV9zZXRfYWN0aXZlX2xpbmtzKCksIHNvIEkgdGhpbmsgaWVlZTgw
MjExX3NldF9hY3RpdmVfbGlua3MoKSBoYXMgcGFzc2VkIHRlc3QgY2FzZSB3aXRoIHNvbWUgdHlw
ZSBsb3dlciBkcml2ZXIvY2hpcD8KCj4gKwkJV0FSTl9PTl9PTkNFKHJldCk7Cj4gKwo+ICsJCWll
ZWU4MDIxMV9saW5rX2luZm9fY2hhbmdlX25vdGlmeShzZGF0YSwgbGluaywKPiArCQkJCQkJICBC
U1NfQ0hBTkdFRF9FUlBfQ1RTX1BST1QgfAo+ICsJCQkJCQkgIEJTU19DSEFOR0VEX0VSUF9QUkVB
TUJMRSB8Cj4gKwkJCQkJCSAgQlNTX0NIQU5HRURfRVJQX1NMT1QgfAo+ICsJCQkJCQkgIEJTU19D
SEFOR0VEX0hUIHwKPiArCQkJCQkJICBCU1NfQ0hBTkdFRF9CQVNJQ19SQVRFUyB8Cj4gKwkJCQkJ
CSAgQlNTX0NIQU5HRURfQlNTSUQgfAo+ICsJCQkJCQkgIEJTU19DSEFOR0VEX0NRTSB8Cj4gKwkJ
CQkJCSAgQlNTX0NIQU5HRURfUU9TIHwKPiArCQkJCQkJICBCU1NfQ0hBTkdFRF9UWFBPV0VSIHwK
PiArCQkJCQkJICBCU1NfQ0hBTkdFRF9CQU5EV0lEVEggfAo+ICsJCQkJCQkgIEJTU19DSEFOR0VE
X1RXVCB8Cj4gKwkJCQkJCSAgQlNTX0NIQU5HRURfSEVfT0JTU19QRCB8Cj4gKwkJCQkJCSAgQlNT
X0NIQU5HRURfSEVfQlNTX0NPTE9SKTsKPiArCQlpZWVlODAyMTFfbWdkX3NldF9saW5rX3Fvc19w
YXJhbXMobGluayk7Cj4gKwl9Cj4gKwo+ICsJb2xkX2FjdGl2ZSA9IHNkYXRhLT52aWYuYWN0aXZl
X2xpbmtzOwo+ICsJc2RhdGEtPnZpZi5hY3RpdmVfbGlua3MgPSBhY3RpdmVfbGlua3M7Cj4gKwo+
ICsJaWYgKHJlbSkgewo+ICsJCXJldCA9IGRydl9jaGFuZ2VfdmlmX2xpbmtzKGxvY2FsLCBzZGF0
YSwgb2xkX2FjdGl2ZSwKPiArCQkJCQkgICBhY3RpdmVfbGlua3MsIGxpbmtfY29uZnMpOwo+ICsJ
CVdBUk5fT05fT05DRShyZXQpOwo+ICsJfQo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwouLi4K
Ci0tIAphdGgxMmsgbWFpbGluZyBsaXN0CmF0aDEya0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHBz
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEyawo=

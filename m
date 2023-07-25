Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504DEEB64DD
	for <ath12k@archiver.kernel.org>; Tue, 25 Jul 2023 19:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQ/Vj4cPOFbyH5qB3Iczfd6VhvPeCBoyh8I2NoZBz8Y=; b=a8Ql1K9IVsKrAR
	0JDSqpAkOYseiOPtqwnVeFygdXVrcoIZS2ioRZjdOx71t8Mx5tZfQgeNQ6156uQ97EpVB1diC2+2N
	oYTa2Vkqw9fJHYxvc9JESDRBp02amC+7QYajekSfMe/BiqWpT1nt/IWgyCUHmwZPpCF/nyI27FRYB
	X4TCgvoNXpoU89ZGW2PrqW7VGWb/7i428km+5oE5YsauAHXHNdTLP0OR3zWbCwkpkvNqvtB0rCQGv
	Au4vzIC7mAtaj7B/5BkyLlUrrsHWnElkl2x16mAfvcW9+ATL7UMR57/cu+gBK0Z5WuxOJYbocVBxe
	ARZ11wTuXjAI71ijWFZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qONxE-008MnJ-00
	for ath12k@archiver.kernel.org;
	Tue, 25 Jul 2023 19:44:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qONxA-008Mms-2V
	for ath12k@lists.infradead.org;
	Tue, 25 Jul 2023 19:44:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36PJdFen026133;
	Tue, 25 Jul 2023 19:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PNuRfmOT8KhHU3Wfu3lF2YLZ/va6SuJ2gN7OEqI7FJI=;
 b=Dla6FG6XiYt5i5TY8cfwfNZFhxELwHXcfxA82efvbrEW4jUN3QuH7bMXhPwOhxPtHsk/
 d0ebD5Xfrz/Az4B4zM4NQ2QunaPkNaM+StPmznevLBG8Y37c6OfmDIGKPElDhZ7S1UQw
 I4nDySqqOLnxhlR+A9q0xy1VbhlmBhjCw/gvyOVg+aLBoPW7Edz05ykI9NI2wnuMulpl
 b0Fs9KXLn4zI3YNeOdwiiUxZUZRdQJE/qddWNiJOsqwW9K842NSZzMUdMqNLWAProQTO
 E1plN/uKIGJTHvNWlRSvMeWPPPCTUvCBf2D9bV2djMQsI+nfVI6f7mB9PLlfUTzqQBjM Ng== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s29xmhq0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 19:44:11 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36PJiAOW021188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 19:44:10 GMT
Received: from [10.227.89.240] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 25 Jul
 2023 12:44:10 -0700
Message-ID: <35c86c8e-afdb-adb6-f331-af74c99d3a02@quicinc.com>
Date: Tue, 25 Jul 2023 12:44:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 03/11] wifi: ath12k: WMI support to process EHT
 capabilities
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Pradeep
 Kumar Chitrapu" <quic_pradeepc@quicinc.com>
References: <20230602235820.23912-1-quic_alokad@quicinc.com>
 <20230602235820.23912-4-quic_alokad@quicinc.com> <87ttv9aqtn.fsf@kernel.org>
 <dc0ae263-e5f6-b876-842a-7b598caf68fa@quicinc.com>
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <dc0ae263-e5f6-b876-842a-7b598caf68fa@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: u2y0msoTWnKJhQkGA4I6oPXuwH6V_P-J
X-Proofpoint-GUID: u2y0msoTWnKJhQkGA4I6oPXuwH6V_P-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_10,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxlogscore=806 impostorscore=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_124416_820846_339EC3FD 
X-CRM114-Status: GOOD (  25.44  )
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

T24gNy8yNS8yMDIzIDM6NTEgQU0sIFdlbiBHb25nIHdyb3RlOgo+IE9uIDYvMTUvMjAyMyA3OjQ5
IFBNLCBLYWxsZSBWYWxvIHdyb3RlOgo+PiBBbG9rYSBEaXhpdCA8cXVpY19hbG9rYWRAcXVpY2lu
Yy5jb20+IHdyaXRlczoKPj4KPiBbLi4uXQo+PiBbLi4uXQo+Pgo+Pj4gK3N0cnVjdCBhdGgxMmtf
ZndfcGRldiB7Cj4+PiArwqDCoMKgIHUzMiBwZGV2X2lkOwo+Pj4gK8KgwqDCoCB1MzIgcGh5X2lk
Owo+Pj4gK8KgwqDCoCB1MzIgc3VwcG9ydGVkX2JhbmRzOwo+Pj4gK307Cj4+IFNvIHdlIGhhdmUg
bm93IHR3byB2ZXJ5IHNpbWlsYXIgc3RydWN0dXJlcywgYXRoMTJrX3BkZXYgYW5kCj4+IGF0aDEy
a19md19wZGV2LiBJdCB3b3VsZCBiZSBnb29kIHRvIGRvY3VtZW50IGFib3ZlIHRoZSBzdHJ1Y3Rz
IHRoZWlyCj4+IHB1cnBvc2UuIEFueSBpZGVhcyB3aGF0IEkgY291bGQgYWRkPwo+IEN1cnJlbnRs
eSBhdGgxMmsgaGFzIHNpbmdsZV9wZGV2IHBhcmFtZXRlciwgaXQgaW1wYWN0IHRoZSBpbnRlcmZh
Y2UgCj4gbnVtYmVyIG9mIHdpZmkuCj4gCj4gRm9yIHNpbmdsZV9wZGV2PXR1cmUsIGFiLT5udW1f
cmFkaW9zIGlzIHNldCB0byAxIGFuZCBhbGwgY2FwYmlsaXR5IG9mIAo+IDIuNCBHSHovCj4gNSBH
SHovNiBHSHogaXMgc2F2ZWQgaW50byBhYi0+cGRldnNbMF0gaW4gCj4gYXRoMTJrX3dtaV9leHRf
c29jX2hhbF9yZWdfY2Fwc19wYXJzZSgpLgo+IGF0aDEya19tYWNfcmVnaXN0ZXIoKSB3aWxsIGNh
bGwgb25seSBvbmUgdGltZSBpbnRvIAo+IF9fYXRoMTJrX21hY19yZWdpc3RlcigpLCBhbmQKPiBp
ZWVlODAyMTFfcmVnaXN0ZXJfaHcoKSBpcyBjYWxsZWQgb25seSBvbmUgdGltZSwgYW5kIG9ubHkg
b25lIHdpZmkgCj4gaW50ZXJmYWNlIGluCj4gdGhlIHJlc3VsdCBvZiAiaXcgZGV2L2lmY29uZmln
IiwgdGhlIGludGVyZmFjZSBzdXBwb3J0IDIuNCBHSHovNSBHSHovNiAKPiBHSHouIEFjdHVhbGx5
Cj4gdGhlcmUgaGFyZSBtb3JlIHRoYW4gb25lIFBIWSBpbiBmaXJtd2FyZSwgZmlybXdhcmUgbWFp
bnRhaW4gdGhlIGFsbCBQSFkgCj4gZGF0YSBhbmQKPiBwcm92aWRlIGEgc2luZ2xlIHBkZXYvc29j
IGludGVyZmFjZSB0byBhdGgxMmssIHRoZW4gYXRoMTJrIGRvIG5vdCBuZWVkIAo+IHRvIGNvbnNp
ZGVyCj4gdGhlIFBIWSBpbmZvIHN1Y2ggYXMgY2hhbm5lbC9CQU5EPC0+UEhZIG1hcHBpbmcgcmVs
YXRpb25zaGlwLCBpdCBpcyAKPiBjb252ZW5pZW50IGZvcgo+IGF0aDEyayB0byBzdXBwb3J0IDIu
NCBHSHovNSBHSHovNiBHSHouCj4gCj4gRm9yIHNpbmdsZV9wZGV2PWZhbHNlLCBhYi0+bnVtX3Jh
ZGlvcyBpcyBtb3JlIHRoYW4gMSwgYWItPnBkZXZzW10gaGFzIAo+IG11dGkgdmFsaWQKPiBlbGVt
ZW50LCBlYWNoIGVsZW1lbnQgb25seSBzdXBwb3J0IG9uZSBCQU5ELiBGaXJtd2FyZSBkbyBub3Qg
cHJvdmlkZSBhIAo+IHNpbmdsZQo+IHBkZXYvc29jIGludGVyZmFjZSwgc28gYXRoMTJrIG5lZWQg
dG8gbWFpbnRhaW4gdGhlIFBIWSBkYXRhIHN1Y2ggYXMgCj4gY2hhbm5lbC9CQU5EPC0+Cj4gUEhZ
IG1hcHBpbmcgcmVsYXRpb25zaGlwLCBhbmQgYXRoMTJrX21hY19yZWdpc3RlcigpIHdpbGwgY2Fs
bCBtdXRpLXRpbWUgCj4gaW50bwo+IF9fYXRoMTJrX21hY19yZWdpc3RlcigpLCBhbmQgaWVlZTgw
MjExX3JlZ2lzdGVyX2h3KCkgaXMgY2FsbGVkIAo+IG11dGktdGltZSwgYW5kIG11dGkKPiB3aWZp
IGludGVyZmFjZSBpbiB0aGUgcmVzdWx0IG9mICJpdyBkZXYvaWZjb25maWciLCBhbmQgZWFjaCBp
bnRlcmZhY2UgCj4gb25seSBzdXBwb3J0Cj4gb25lIEJBTkQsIGZvciBleGFtcGxlLCB3bGFuMCBv
bmx5IHN1cHBvcnQgMi40IEdIeiwgd2xhbjEgb25seSBzdXBwb3J0IDUgCj4gR0h6LCBhbmQKPiB3
bGFuMiBvbmx5IHN1cHBvcnQgNiBHSHouCj4gCj4gRm9yIHNpbmdsZV9wZGV2PXR1cmUsIGF0aDEy
ayBhbHNvIG5lZWQgdG8ga25vdyBzb21lIGluZm8gYWJvdXQgdGhlIFBIWXMgCj4gc3VzaCBhcwo+
IHBkZXZfaWQvcGh5X2lkL3N1cHBvcnRlZF9iYW5kcyBpbiB0aGlzIHBhdGNoLCBzbyBhYi0+Zndf
cGRldiBpcyB1c2VkIHRvIAo+IHN0b3JlIHRoZQo+IFBIWSBkYXRhLgoKClRoZSBuZXcgc3RydWN0
IGF0aDEya19md19wZGV2IGlzIGFueXdheSBnb2luZyB0byBoYXZlIGFzIG1hbnkgZWxlbWVudHMg
CmFzIHRoZSBudW1fcmFkaW8sIHJpZ2h0PyBUaGVuIHRoZXJlIG11c3QgYmUgYSB3YXkgdG8gcmV1
c2UgdGhlIGNvbW1vbiAKc3RydWN0IGF0aDEya19wZGV2IGluc3RlYWQgYXMgaXQgZG9uZSBmb3Ig
UUNOIGRldmljZXMuIEkgdW5kZXJzdGFuZCB0aGlzIAppdCB3aWxsIG5lZWQgY2hhbmdlcyB0byBh
bGwgdGhlIGV4aXN0aW5nIGNvZGUgZm9yIHRoZSBzaW5nbGUtcGRldiB3aGVyZSAKaXQgbWlnaHQg
aGF2ZSBoYXJkLWNvZGVkIHBkZXZbMF0gZm9yIHRoZSBvcmlnaW5hbCBzdHJ1Y3R1cmUuIFNvbWV0
aGluZyAKdG8gdGhpbmsgYWJvdXQgaW4gYSBzZXBhcmF0ZSBwYXRjaC1zZXQuCgpGb3Igbm93IEkg
d2lsbCBzZW5kIG5ldyB2ZXJzaW9uIHdpdGggY29tbWVudHMgKGFzIGZhciBhcyBJIHVuZGVyc3Rv
b2QgCml0KSBiZWNhdXNlIHdpdGhvdXQgdGhpcyBwYXRjaCBXQ04gZGV2aWNlcyBzaG93IGEgY3Jh
c2ggZHVyaW5nIGJvb3QtdXAuCgpUaGFua3MuCgotLSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgx
MmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMmsK

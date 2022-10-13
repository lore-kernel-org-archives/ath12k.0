Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6276AC433FE
	for <ath12k@archiver.kernel.org>; Thu, 13 Oct 2022 06:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXSmQk7d2qPBEV70QVoMrOqCoSjRCmm8op+GUPTgn/Q=; b=oZBpux667exryI
	9Qv4sjwsbPicYaxwuozRf8Lbm/BNXxXuzLIwgBEHKPKtGbUabL0bCauPcmx20v/3y6EZw06AwIHHN
	3aFYRE0bgAVCMA6nH2Y8Iuw6K4ZXdQXqz76uz7hEJbqFh1/fr4GKOdJoiBu1365pNTQrGd2FySDXY
	KOje1MzH7vdq7hFwgBPYw5VseuAsh6Yo+QNgBXygV4lVh6C5WlljHFM8LiP3Mv15HVAxGNYSJO4He
	3WMBJMN9cORMGFV+JxyfV6dNTXU+pCpj+R6vXr279zdJO7rM7ueKBdgC9uMgIdWMjoC3lW1ekMQQk
	feaHi1TgR1QZ1W0uXEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ois39-00AuOy-Pn
	for ath12k@archiver.kernel.org; Thu, 13 Oct 2022 06:50:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ois37-00AuMr-0O
	for ath12k@lists.infradead.org; Thu, 13 Oct 2022 06:50:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29D6GGxM010972;
	Thu, 13 Oct 2022 06:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6OIDCA1oxq6p7/yOMy8f8At7MzGN42WTJEdOinTHcQM=;
 b=hA+ExTeuAJt0UKXHtF05jL7oSDiG4hIB3CWpEnyTE7TDEDI41KA37wtUUISNRR2EuDWo
 ygofLqggKhB55id8M5W8wugJMV0ejTDAHvpCuECpzR/6dyIc89ow15uRZHmZF8w2GSIk
 eRKL3W2Ys1Wa3mRKi2bv2/GrKYyfmpJ5tb8W8N5WXjg/kPy1zZrJjiXspeG54zEkEQjB
 JalxebA2xu6fX9rKAPvge7gU8fjpYW6YwCwn/XMVeBhpUUSR4XHjZey6t4DJ1dbosdpK
 umqi0pyiL+CdtFHaGCZR1kfzfQSTgRokHqwgFwddL8wBcRTYNZHE/MP5NNksX9hO7/B8 uA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k643h1naf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 06:50:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29D6oS3W015380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 06:50:28 GMT
Received: from [10.110.65.190] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 12 Oct
 2022 23:50:26 -0700
Message-ID: <0e4a896d-1d57-166b-9cef-fd551d22464b@quicinc.com>
Date: Wed, 12 Oct 2022 23:50:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 15/50] wifi: ath12k: add dp_rx.c
Content-Language: en-US
To: "Sriram R (QUIC)" <quic_srirrama@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-16-kvalo@kernel.org>
 <b2cd5b02-60ca-c788-af71-9f36f6a8ede3@quicinc.com>
 <SN6PR02MB433498DC221CF70BE3B6CE63F7229@SN6PR02MB4334.namprd02.prod.outlook.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <SN6PR02MB433498DC221CF70BE3B6CE63F7229@SN6PR02MB4334.namprd02.prod.outlook.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZfZfgKTE4KW6dIJtnrv5LdK_bOkNHupZ
X-Proofpoint-ORIG-GUID: ZfZfgKTE4KW6dIJtnrv5LdK_bOkNHupZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_04,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 mlxlogscore=569 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_235033_078425_562C18F2 
X-CRM114-Status: GOOD (  13.89  )
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

T24gMTAvMTIvMjAyMiA0OjM5IFBNLCBTcmlyYW0gUiAoUVVJQykgd3JvdGU6Cj4+PiArICAgICBl
bGVtID0ga3phbGxvYyhzaXplb2YoKmVsZW0pLCBHRlBfQVRPTUlDKTsKPj4+ICsgICAgIGlmICgh
ZWxlbSkKPj4+ICsgICAgICAgICAgICAgZ290byBmcmVlX2Rlc2M7Cj4+PiArCj4+PiArICAgICBl
bGVtLT50cyA9IGppZmZpZXM7Cj4+PiArICAgICBtZW1jcHkoJmVsZW0tPmRhdGEsIHJ4X3RpZCwg
c2l6ZW9mKCpyeF90aWQpKTsKPj4+ICsKPj4+ICsgICAgIHNwaW5fbG9ja19iaCgmZHAtPnJlb19j
bWRfbG9jayk7Cj4+PiArICAgICBsaXN0X2FkZF90YWlsKCZlbGVtLT5saXN0LCAmZHAtPnJlb19j
bWRfY2FjaGVfZmx1c2hfbGlzdCk7Cj4+PiArICAgICBkcC0+cmVvX2NtZF9jYWNoZV9mbHVzaF9j
b3VudCsrOwo+Pj4gKwo+Pj4gKyAgICAgLyogRmx1c2ggYW5kIGludmFsaWRhdGUgYWdlZCBSRU8g
ZGVzYyBmcm9tIEhXIGNhY2hlICovCj4+PiArICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUo
ZWxlbSwgdG1wLCAmZHAtPnJlb19jbWRfY2FjaGVfZmx1c2hfbGlzdCwKPj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBsaXN0KSB7Cj4+PiArICAgICAgICAgICAgIGlmIChkcC0+cmVv
X2NtZF9jYWNoZV9mbHVzaF9jb3VudCA+Cj4+IEFUSDEyS19EUF9SWF9SRU9fREVTQ19GUkVFX1RI
UkVTIHx8Cj4+PiArICAgICAgICAgICAgICAgICB0aW1lX2FmdGVyKGppZmZpZXMsIGVsZW0tPnRz
ICsKPj4+ICsKPj4gbXNlY3NfdG9famlmZmllcyhBVEgxMktfRFBfUlhfUkVPX0RFU0NfRlJFRV9U
SU1FT1VUX01TKSkpIHsKPj4+ICsgICAgICAgICAgICAgICAgICAgICBsaXN0X2RlbCgmZWxlbS0+
bGlzdCk7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgZHAtPnJlb19jbWRfY2FjaGVfZmx1c2hf
Y291bnQtLTsKPj4+ICsgICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9ja19iaCgmZHAtPnJl
b19jbWRfbG9jayk7Cj4+PiArCj4+PiArICAgICAgICAgICAgICAgICAgICAgYXRoMTJrX2RwX3Jl
b19jYWNoZV9mbHVzaChhYiwgJmVsZW0tPmRhdGEpOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
IGtmcmVlKGVsZW0pOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHNwaW5fbG9ja19iaCgmZHAt
PnJlb19jbWRfbG9jayk7Cj4+Cj4+IGlzIHRoaXMgcmVhbGx5IGEgc2FmZSBpdGVyYXRpb24gaWYg
eW91IHVubG9jayAmIGxvY2sgaW4gdGhlIG1pZGRsZT8KPj4gd2hhdCBwcmV2ZW50cyB0aGUgdG1w
IG5vZGUgZnJvbSBiZWluZyBkZWxldGVkIGR1cmluZyB0aGlzIHdpbmRvdz8KPiBUaGUgcmVvX2Nt
ZF9jYWNoZV9mbHVzaF9saXN0IGlzIHVzZWQgaW4gb25seSB0d28gY29udGV4dHMsIG9uZSBpcyB0
aGlzCj4gRnVuY3Rpb24gY2FsbGVkIGZyb20gbmFwaSBhbmQgdGhlIG90aGVyIGluIGF0aDEya19k
cF9mcmVlIGR1cmluZwo+IGNvcmUgZGVzdHJveS4gQmVmb3JlIGRwX2ZyZWUsIHRoZSBpcnFzIHdv
dWxkIGJlIGRpc2FibGVkIGFuZCB3b3VsZCB3YWl0Cj4gc3luY2hyb25pemUuIEhlbmNlIHRoZXJl
IHdvdWxkbuKAmXQgYmUgYW55IHJhY2UgYWdhaW5zdCBhZGQgb3IgZGVsZXRlCj4gdG8gdGhpcyBs
aXN0LiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhhdOKAmXMgZmluZS4KCnBsZWFzZSBhZGQgdGhh
dCBhcyBhIGNvZGUgY29tbWVudCBzaW5jZSB1bmxvY2svZG8gc29tZXRoaW5nL2xvY2sgaXMgYSAK
ImNvZGUgc21lbGwiIHNvIHlvdSBzaG91bGQganVzdGlmeSB0aGUgc21lbGwKCgotLSAKYXRoMTJr
IG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK

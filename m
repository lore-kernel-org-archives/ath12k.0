Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6368C76195
	for <ath12k@archiver.kernel.org>; Tue, 28 Mar 2023 07:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKe8Q/x05pT5dW4bAAxzJGhS1wTS6MMY9bmiJmCHdiM=; b=mMBKlsFa6NsZ9n
	OlR3Lc30vpiGednRdDKfUhEbDZ7EMpTUWRtHH1FjnKqjSvteIniE6YLZvxzXeZWYDvF8gDIUpA+an
	k9Is+26FsXatZWpHCtwZh9w/fRWDIMRXradA99+NfHPUb8B3xbBDjmM/UzNUxLiZvX72uSf7Jpm1A
	2xVkHdFUAuFM3frSzqMHMrguGHvqUQxB0eN31rHvDua4rIMpzkxs3gbRWzT7hbCbfOmSh95O/FLeN
	7CZxxPDjsRHENFoldvPQ5iS0mFvkxAUe/jo+qpwl9mWCv9zFmC4VkMKhE4JBmlQkv0RiwYUY5P2ox
	PjWEjGEO8t1x4c2ty78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3tu-00DUDo-0r
	for ath12k@archiver.kernel.org;
	Tue, 28 Mar 2023 07:37:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3tr-00DUBx-0K;
	Tue, 28 Mar 2023 07:37:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S6XI0j027091;
	Tue, 28 Mar 2023 07:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4MVlWy4NFhxOZasxy7oIO0wAjWNo3jsta2IHJO78OHE=;
 b=B93GffEDcU9hXO2R9MDw5r1WDGyFGv/TTq5k0sf91YPs10MZDX/eoEti3hwB0mz0I4BR
 d4NG5FF0sC7q6VZRC4pVVGU2WuPO6UWE+JyrYQifBOl+4vRKkcveljDJzCZUunqfpH0u
 5tAZNcROJ2+yYbaMAJC4S5r3J57OscTOziy2vkwjQI2puQF0sTVuSefXA4PXYKwbMJ9W
 QOt1dvIr3fcxbEVQp2q+dW3zYSg8rVHUwpZwX2QLHYH8OrBC4Ob5aPz7XybsOnRDil7R
 RiZcWUc+Yx21JGV0FLY7Rnp2sDIeLuL3paKZL66o1keCTRtaMDS4LeCyFjtF/zyta9+e Gg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pkbywabb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 07:37:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32S7bjS7004685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 07:37:45 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 28 Mar
 2023 00:37:44 -0700
Message-ID: <7872a08d-fe37-a876-713d-c5ec40c1893f@quicinc.com>
Date: Tue, 28 Mar 2023 15:37:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 24/27] wifi: mac80211: implement link switching
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.d99dfbe65c90.I92385ba882ec984a9a2ad18293173436657e82aa@changeid>
 <ca5177fe-3b9f-2309-9afd-1d5e827540f7@quicinc.com>
 <50719d34bc48d816d00b56d3d9efdb59e3e51a16.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <50719d34bc48d816d00b56d3d9efdb59e3e51a16.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XPV9NJl-6xfUfQWlQrUYxi8WaQlYxG42
X-Proofpoint-ORIG-GUID: XPV9NJl-6xfUfQWlQrUYxi8WaQlYxG42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=886 spamscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_003747_140917_ED3AA0B9 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

T24gMy8yNy8yMDIzIDQ6MzEgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Ci4uLgo+PiBBbHNvIEkg
c2VlIGNvbW1pdCg4ZmI3ZTJlZjRiYWIgbWFjODAyMTFfaHdzaW06IGFsd2F5cyBhY3RpdmF0ZSBh
bGwgbGlua3MpIGFuZCBpZWVlODAyMTFfaWZfcGFyc2VfYWN0aXZlX2xpbmtzKCkKPj4gd2lsbCB1
c2UgaWVlZTgwMjExX3NldF9hY3RpdmVfbGlua3MoKSwgc28gSSB0aGluayBpZWVlODAyMTFfc2V0
X2FjdGl2ZV9saW5rcygpIGhhcyBwYXNzZWQgdGVzdCBjYXNlIHdpdGggc29tZSB0eXBlIGxvd2Vy
IGRyaXZlci9jaGlwPwo+IFllcywgd2UgaGF2ZSB0aGlzIHdvcmtpbmcgb24gaXdsd2lmaS9tdm0u
Cj4KPiBqb2hhbm5lcwpNYXkgSSBrbm93IGhvdyBkaWQgeW91IHRlc3QgaXQ/CgpEaWQgeW91IHRl
c3Qgd2l0aCB0b29sIGxpa2UgdGhpcyB3aXRoIHBhcmFtZXRlciAiQWN0aXZlVHhNdWx0aUxpbmtz
Ij8KCiDCoCIuXHNpZ21hLWR1dCAtbCAKc3RhX3NldF9yZmVhdHVyZSxJbnRlcmZhY2Usd2xhbjAs
cHJvZyxFSFQsQWN0aXZlVHhNdWx0aUxpbmtzLDAyOjAzOjdmOjk1OjIxOjk3LEFjdGl2ZVJ4TXVs
dGlMaW5rcywwMjowMzo3Zjo5NToyMTo5NyIKCgotLSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgx
MmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMmsK

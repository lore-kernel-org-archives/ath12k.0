Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C244EC982FA
	for <ath12k@archiver.kernel.org>; Wed, 23 Sep 2026 03:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae6gy9+PTa4qOcfFJrlLX0N+HPRF6sDIXYy3c2z96Qc=; b=lJeGFCABjXAwmuBC+dIDBLnjUY
	na8+a7eQZiPEpDpnqLGHcVADecevg8ntQq5+ovAIUCuQ7YvfnG2LCx5A8irvxeHxbzW0AfXJ/1VS1
	YxJYXM1hzmwSCbCKel5JDQRunbxWcqkd/1rfVY50kJN3HUaMgFDJmUx7T87BgkeH8uVfRmraLLNQx
	5M79B3JgmXM7hOuYR6VqWR3B7ZBog8N0359JFfr2wMoJT+QQ8OJNwDBzzsnHFctjXQlzp81f1yzca
	FIhZ8EYJ0U8/iwmYULjulWClO5PBJ4kQQ71ZwEdzussU4+t/etIxlU2gIrPJqS7RinckK/sRLXjxw
	u+NB/J2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9DeK-0000000738G-1xXP;
	Wed, 23 Sep 2026 03:28:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9DeH-0000000737q-1vGg
	for ath12k@lists.infradead.org;
	Wed, 23 Sep 2026 03:27:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N36D3s1348991
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 03:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ae6gy9+PTa4qOcfFJrlLX0N+HPRF6sDIXYy3c2z96Qc=; b=PROWSGHRjNXwSWSm
	olupPxWyO1s1T9w0Fw/Aj/xTTddFxxgpN7yS+yQDUVJK55n9VPnGD89tX/AL9Y5z
	jZmnSlG/oQpCgwzblDP+seg8ZoCi4xheBc+P4gdrdC98AUBZc7FN+WHE91h7WtYx
	xmDzohNskb7RzrBTwOf5Afjw9fG2yXmFAUl6jVif+lzJ0Cn1dFoTJ80V477dej2w
	18ApKVa6rbEGBGhpsRZHJ+XScvpvdxMkxUTl18GfQC+PNLlvT4HAPa2Mp7lPRJbt
	rDRJI910gIYdpgjLpIoo1a21HYPPnPj53/yS4Q5EoCgYAshI6v0HKeJTGDXvu1s+
	XpU4xQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8628xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 03:27:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so332242a12.0
        for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 20:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790134075; x=1790738875; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ae6gy9+PTa4qOcfFJrlLX0N+HPRF6sDIXYy3c2z96Qc=;
        b=OaSYrpOnluvCggoPmx+dZveLRBUmgqDuM59Uj8i0Nygxa4yjugyhqqigxenNmtWzoD
         OnwgEVNsHdkFDA063kgKyiHVdLLof3kQWQSGv6LwfPvzW4jIcV+OYJT+shhv9GyxL83D
         PxZgXvVNofXK+Cw/zKEYIVElrKoyx9ECESpKywKRbyBVCdv6h5IwdtFPycvby9ifbimE
         8otH8UtMR5HpqYpqZbd1NHYjB8sXdquZmWqFUKQRP4A49kgI9pYn884FxmBe4M3pilvd
         PE51p26wS4KXF5m/mlYKzeg5b88ioLFifyOpICtriVxt6N/JkJSjgi1kJz9sG3Yqdj7l
         VvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134075; x=1790738875;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ae6gy9+PTa4qOcfFJrlLX0N+HPRF6sDIXYy3c2z96Qc=;
        b=Dzf0PN2/0/PRSQfKQn94HnyIV/YpMLd4xv86QmA1yhx1d/IZa3JClsMBY90Kk2Z5jX
         joc9XPZ7Hun7gM4Sa0XJd0iaZgNOYn3ieQUWiL+QBFuY6kwVEL47qeamVbetAfgoB3P6
         RnHb2frWky8cPSb+jNfXaAd81VR9kJnAyH/dpmylF1C0tn7YvlE0E7lxbqXbU3oi/aJO
         8FcIbkT3lh7DC83FsVGqnVwZxlXFfdksdAvVgJCF/WTracskVswRgutpWfx1I9rQPIsM
         90+KznAuIaBdyHA7VlvqNbzsIolp3wKOD3M8gGPVQT6YWS8fE2DfhMpjjbKDMPq0VsK9
         sugQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWkWXqaxqKtXCtqKVpLdJuwmCLxIAywEQ+gQFL92ICEvulSenAbGuNPakCZxHcDpQXtriw1PM=@lists.infradead.org
X-Gm-Message-State: AFuF++kDet7u5Lo66ko5jWTGcvfDRcvsTytw3l8GEBn4QWIf0mVORw3k
	AmADeNomS6jo6fLrd+FiKb/yZOAOvYYoV8sUKoFTyOJPTbX8U7NscGiSWpD0wBlmdiCFY6xxoIE
	W2FiNNYErO+Jctitw9CqHPtj7FuCy8RDWG4Onp3tEVLO7p+58YJfZTWG6/hJCSkqS
X-Gm-Gg: AYBFou0FEKPqbagIj3AOOxx7HVlDKYCDVkoyzXxOJEYL+qqkh/siizLpiLY7xW/zH2J
	zfXbRhR32a56qTDcR03irQrvEXmcnbipajp7yb3uABAkTv1v/EDUpT1oCCx3nMzR1Fd3YhxRIN6
	MsDJFkqz+udng4kGaFYCOkOpq7jPQ3R580NkSq0BFbjpl6S4Eb5S7IE39/wFy4rarkjMDtav85m
	iFyuuVX9fpOZABNUQQUtWUe4E2gusASZqkOuoUm+lrXPcBaMWRFnP7Nxw2qIbpfinVpRQQWz1nq
	AGYjHbNvEevfE9Fwv1lZz5aIyBpVsGWVBzuUZSE3WHe+XYyI5zm1JyQVGA4vVyOAQq9mBOgjdIL
	oeiN3yycBfTUiFOpH9myHruUkSFImV15Af6/biX9oWkzzjxQKpA8TGn3/RLPi8HBXYsX1tTcWQw
	==
X-Received: by 2002:a05:6a21:4d0f:b0:3dd:85a9:55a1 with SMTP id adf61e73a8af0-3ddf81fa4ecmr1204388637.35.1790134074783;
        Tue, 22 Sep 2026 20:27:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d0f:b0:3dd:85a9:55a1 with SMTP id adf61e73a8af0-3ddf81fa4ecmr1204380637.35.1790134074304;
        Tue, 22 Sep 2026 20:27:54 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dad3978sm548593b3a.34.2026.09.22.20.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 20:27:53 -0700 (PDT)
Message-ID: <2dd83d65-ff4b-4598-979c-481c11bd18f1@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:27:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/7] wifi: ath12k: convert DP profile parameter
 macros to inline helpers
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, vasanthakumar.thiagarajan@oss.qualcomm.com,
        quic_periyasa@quicinc.com
References: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 56_Ra0S-GgU2Au2SJQFz8a0Trp07jjLo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX39UM6uCH14DC
 JL/7WO3rKgBSrssL3jpnqWeNoDH1vmc5oT/1XCgwY9UQOg1uiOiGOKgIAKLcfqjpMHyAXKbAOQx
 bjqJABQS8lixxO0DxXsEv9YTOCK0nRc=
X-Proofpoint-ORIG-GUID: 56_Ra0S-GgU2Au2SJQFz8a0Trp07jjLo
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3473b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=egVK8HpoOGdWJymRfCUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX/5C0WtmJlxSY
 YhddegKo3MHfV/DJl1xLp1EfUF0nUDEE42Wzy+7vXkfo+Rv0Izw70dJ4LuYcahSbg7oUf/MpP6M
 ry/0/pqL1yZ3/Hr93xYAgILDHdQHlbD+2nIJD70Zb/MuksINiVmexFCJLsmr+VcZ2M8LNE6vSgZ
 EGj5dEUy2hmeUe2t89vXnTVNx8G7oIvdvFLDmPabJVWWfnHaog9z51BXetEdQHOH/a5hnJ+QDVp
 o8z5POnyJoXcjh6PP+OzLJJeGCHtyqbrNHGqPfowxMhXTZ9GzPIUMNFXCo5a7y8joK+OLgMFOpM
 24jIU3hykFZdvSVc4Wcoyd6IN4wsbK4/gFq4DSINQTgyCiE6mLw/QPsw1W0U0kY14Zv86XGGSCS
 eUrge8UtNx9YFYywIo8xDjG2dufwzDjJxMAs3sMWmy9OsozYE5PTtibCB6w7R43flrp5miyIAAE
 R3OJXdgTzW8xjm+cgnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_202757_685897_459F9B5F 
X-CRM114-Status: UNSURE (   8.96  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org



On 8/20/2026 1:47 PM, Aaradhana Sahu wrote:
> Convert the Data Path (DP) profile parameter macros to static inline helper
> function without changing any functional behavior.
> 
> Aaradhana Sahu (7):
>   wifi: ath12k: move dp_profile_params to dp.h
>   wifi: ath12k: convert DP_TX_COMP_RING_SIZE to inline helper
>   wifi: ath12k: convert DP_RXDMA_MONITOR_BUF_RING_SIZE to inline helper
>   wifi: ath12k: convert DP_RXDMA_MONITOR_DST_RING_SIZE to inline helper
>   wifi: ath12k: convert ATH12K_NUM_POOL_TX_DESC to inline helper
>   wifi: ath12k: convert ATH12K_RX_DESC_COUNT to inline helper
>   wifi: ath12k: convert DP_RX_RELEASE_RING_SIZE to inline helper
> 
>  drivers/net/wireless/ath/ath12k/core.h        |   9 --
>  drivers/net/wireless/ath/ath12k/dp.c          |  81 ++++++++------
>  drivers/net/wireless/ath/ath12k/dp.h          | 100 ++++++++++++------
>  drivers/net/wireless/ath/ath12k/dp_rx.c       |  12 ++-
>  drivers/net/wireless/ath/ath12k/mac.c         |   5 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  12 ++-
>  6 files changed, 140 insertions(+), 79 deletions(-)
> 
> 
> base-commit: e07447e654476262558bee570f4cf456e2b32565

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



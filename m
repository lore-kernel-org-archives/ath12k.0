Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9188CA6012
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 01:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVmBYDxULmgBexd3mljS1XdVWxhKoPuBecD0X+dypus=; b=d4dLoLZ8+Ws00EmZEHo5sbIZ9t
	Rq1FnuLByc7MsYZE47T9+refdwJr2e3+oaIMm+FyHmGnyElJBftf57GwAm90kpVA3PC/8ePQqJlqN
	FSZGrE4M496kC8Qov2lxOhdSORHhrngk8o7pqm1m4p0wCi1Xguc3MDR8MSXZaLvLJH0/q0w1iwYj3
	eJASwM8Ejx11pDE8/vDpFImZ2Yz3sgrXNi0vJ8H1MDBMnyi+LB7/PbnWkRP9kcrFKMSFhUfrew54b
	vEI3V9tZeFrHPxvYPTgVJPmMXjSQciMAOVs0/6znYozvv0KwWp0hM9YX8qH9T1AoWn0W+5Ia0OeYa
	/udMn59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEznu-00000005Fzt-2CF4;
	Fri, 09 Oct 2026 01:53:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEznq-00000005FzW-0uz2
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 01:53:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990Pq5e601762
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 01:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RVmBYDxULmgBexd3mljS1XdVWxhKoPuBecD0X+dypus=; b=hYoriRDpkv7cDPRY
	qji4J6LUI724hUWhFWHG0bwl4XXTLcuQVl9OQkpiyy/xbsAowdPhvpdxf2GIxiq0
	V0x8bQpGTufaZEZtXmgjqtvqNxA3o3tq0PcI8VpK1mLZbl0GqasppaAdyLeYNn5X
	UcBc7XK8QXABAyl11m84hJSOiTZg91cFYqLZ1vBW57FiqS/9ojSJGLOubEqBxWtZ
	8c/FTyxdy768AXUS3PenFTFtsW86wYJL55SNoVhV1WXfdmX0KGrYq5D7D8VemXRb
	gOOWg2odUzAKMxecBo5YifCdnhx1pGOeq5CDUxZMrsnujI8+3MMQcBF357auJVsj
	JhZxvw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj1bw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 01:53:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7e92f36f9so5058934a12.3
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 18:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791510820; x=1792115620; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVmBYDxULmgBexd3mljS1XdVWxhKoPuBecD0X+dypus=;
        b=eKbABv+hXQwfKRbl2Uqu2Hc0QXsoRHSZa91Grbc+2eylMmVCBU5+rvaK/wQmdSmOQj
         6zlQNmT6EUT0GdTcyfDpKAO1Xp2Squ0FUNv6oSaTt0KObCVn+GOiX5c0vxW/rCdvnnpM
         AZ8y1mBuwe7Tyn9muiVtFXocpjHbQd+Hy22h4Y5Wk/IcRcrZG0jCB0o5OtngOg2mwnRq
         o34Z/YbfWfXKmWwU001I8P9i/PZMknNQ2rzd7VnJirepsofjerC89Lb5w7OUohZsitdL
         oWwjz92OJOmy8UnhCkGLQYro4vp/kssY98FtBP5ERnP1fyLeH7HqOx+iWrTCs1Dq+lRi
         FkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510820; x=1792115620;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVmBYDxULmgBexd3mljS1XdVWxhKoPuBecD0X+dypus=;
        b=2eHSvd/SM9rJebFRoRVKyaoBL8DjhlaOQwBLwPlb9otbWlWeQ/wx7te9bLrrabPDC9
         Si7L8rDwzjGuVvY9cdCESn0bkDgKh8lkSLnxgAaJvlkoD923h/VdVJyrxdRu7wUp/IV9
         ceEoZO7I2nPBBu+jvWOrJU9aTOuFaqIDZ2VrkRfCLmk6RIjpxumFycFXutHJRa3fFLs+
         e0x6HEJvOa31haiFu/VS70fxPjtzA7Bm4Gir3M/xF2lLflU1IvGIzRND0r70UhNECwRh
         zmV/4/UNzAM01HQU+/ChRFD67tE3tGtPt5vx3pwZqmCcer1gAgtswC93KUjeBwKddS2v
         PoIw==
X-Forwarded-Encrypted: i=1; AKwUvBxMc2gqz/GaMHsNzeOH39nSpfCv1cPItz6DmY60/w3rDYlAPFfhuNcKdDSh8FbuRtAIGSGB/oo=@lists.infradead.org
X-Gm-Message-State: AFq9FYIflE2BHnhNF7+5Wl8B8ATIuSkne5hN+rBdko1qFU5+wJ612hu1
	E6K7mKoo9NV9FQpLrmuR1XyVO0oKwSMZV9WxkvRCPkzScikkQj/7be6vSS10ZVXLkBxcgkBS0an
	gZLURfMmzvvYI+nQBEzWTrOE3sSiRBPaCWm+8li2JgRCRwjT0aM4MYrHDxEf3s+jX
X-Gm-Gg: AYBFou2cVLwKlVzRlsjOPjDgR0OU6wa23r2Q4r1TThgU2B+XsynMh6z+HVrityfUWCr
	EtBdgsu0TmA0cUz19m8y5b0Q07mQgqdzIDU/NyOQtAIg5jgwROEb9yQ4RTGvUYKSHR/oph0ztSR
	v86n8Q4Dxq030edygcTZIiw9mnRycllQGAm7LlR3uV7/8il5le+FAQ6XoAH9EDe9pNVfQGZ/kp+
	7C8CRRPzAE9jxHCVpQhXnJ1aU8N164xGTRcxr4G7IF4ywngm8RCfJkjWstaLkqrqX8afknQCHfj
	kAEt4knkh6ZzsJPTkTKr4qd2NCDTWXdI7TIcqITs2pTMVvGkist8CGlL6IrLbuzfVDZ0WlGIF9A
	lvFEr3Bnjp0ScpewQQsACfyAFfUPkzIc+ZBg0f/BQi56I9BGNof9gcjTOmajr7Xa4FI2/IOfz
X-Received: by 2002:a17:90b:3b48:b0:3a0:2817:1fcf with SMTP id 98e67ed59e1d1-3ab3a90e82cmr527134a91.11.1791510819951;
        Thu, 08 Oct 2026 18:53:39 -0700 (PDT)
X-Received: by 2002:a17:90b:3b48:b0:3a0:2817:1fcf with SMTP id 98e67ed59e1d1-3ab3a90e82cmr527118a91.11.1791510819521;
        Thu, 08 Oct 2026 18:53:39 -0700 (PDT)
Received: from [10.133.33.26] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386ba90sm848786a91.1.2026.10.08.18.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 18:53:39 -0700 (PDT)
Message-ID: <b106f056-3384-4576-be23-590e57eaa829@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:53:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Configure RXDMA buffer ring
 size per memory profile
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
References: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac84924 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PJ0sSsB0_FnI-LRpuPcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Lsq9augWGlxo1doRfMcrDT7X4gkgTTeU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAwNyBTYWx0ZWRfXw0lc38mBorrI
 u2z4VTcwCOuf8GVRfu2C6E6Qwh+wvpxYPo9yd8QcggcOq64bXM02GRbubn0lAgXcgWGJaii6Ptf
 Usk3IJbmomJf9OqsEYzpFWARt+4Vkd3T6uTxIlYhvmIru+urr8NSZvBSbAX/zZ7a7jHXd257Vm0
 24EkH93mUChUHuoIconLicV2jnf+qHeK5mEA/Y9/Iq4+w/PieAhxqQ3yvYp5q4C+1ZEKaj10wEu
 qVjUNZdOT9E3NRB3naYFD4/QayWOTrsXqMN/V3wJEHMn4rowrCZZLKK7+BuXrVnBNAuCrIsVRxx
 TMU9EJa80uuKmbuEcbcuWRjV66uh751a/MNg7AJ5AXydMcBAnYVfJu7Z4RFNiE9AwUMlA7TV5is
 ByDLKfWwEGr6DxFfOhqfRCxS9qNEEyK9ZrgUHOBFwHu+W8HGKLm3PzHgFqU+e72V3/ZLdy/eFiN
 K5Tx9aw2PfFP1KrSkSg==
X-Proofpoint-GUID: Lsq9augWGlxo1doRfMcrDT7X4gkgTTeU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAwNyBTYWx0ZWRfXwYXD3qMot4Cg
 FlTNU3PmIZIJwQvq920g4xXayXEKtnP9qbHl9oxN826RqyFw+V3oz7T9lqs+Y1H/pLs5LFenrMD
 I1pdzNpBRQyYH72d0TNJhw4A7tnwck8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_185342_387557_6251EBE3 
X-CRM114-Status: GOOD (  12.30  )
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



On 10/7/2026 5:23 PM, Aaradhana Sahu wrote:
> The RXDMA buffer ring size is currently hardcoded and shared across all
> memory profiles. This makes it difficult to tune the ring size based on
> the requirements of individual profiles.
> 
> This series first makes the RXDMA buffer ring size configurable through
> the memory profile configuration and then increases the ring size for
> the default profile to improve RX traffic handling.
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
> Aaradhana Sahu (1):
>       wifi: ath12k: Make RXDMA buffer ring size configurable per memory profile
> 
> Pavankumar Nandeshwar (1):
>       wifi: ath12k: Increase RXDMA buffer ring size for default memory profile
>  
>  drivers/net/wireless/ath/ath12k/core.c  | 2 ++
>  drivers/net/wireless/ath/ath12k/dp.h    | 8 +++++++-
>  drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
>  3 files changed, 10 insertions(+), 2 deletions(-)
> ---
> base-commit: a90ebf2176db07c5d91e0a62e15ded1fd50710a0
> change-id: 20261007-mpp_ws-a041d5cfac9a
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



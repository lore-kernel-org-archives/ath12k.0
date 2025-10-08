Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EA4CAC5BB
	for <ath12k@archiver.kernel.org>; Wed,  8 Oct 2025 16:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ss99cPPCtTuFplUwVBzHekqSJ/wYgBUqZ5l02AsSTxw=; b=Q872L4J+9WXhY3TKF+3ykkWjyw
	u8NAqZ6tB1GuIwNf0jLeR/7OMRgY80lcn3wUAlwZEUD46lCWdf1dh/HGSRPjvd8fUzK89mmIHGBis
	2PI4iNmI0X76qxq3d3WMIKap36TIHK3477WNgbut57lxjZ2ZFuRGEnjSXrToEz5oqeSJq5BsBHREj
	lP6oN2gAxX2SptCunno1/rf3l3h97r3S7H9pNJ2kE7peuWwDD7srs8s6q/b7nf+P2VjSLsGJOycYY
	doWaRgRB5CLd+PzThNRGZwaznTmdrcMp7dhj0yxZKSJe2axBYUPkDeeBt7Nvs8t5jYlJBHHoOvqu9
	N/8/0cgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Wjl-00000004Gmr-05iU;
	Wed, 08 Oct 2025 16:09:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Wji-00000004Glq-34Vv
	for ath12k@lists.infradead.org;
	Wed, 08 Oct 2025 16:09:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890PPW011898
	for <ath12k@lists.infradead.org>; Wed, 8 Oct 2025 16:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ss99cPPCtTuFplUwVBzHekqSJ/wYgBUqZ5l02AsSTxw=; b=JAM/mBDVdhdnW2Kc
	9W3IOKxKUm35UunJ2xlJgAWAHrTGlnF3wq8ioHiqAZOHre4GoCVUNPRdfNpEUh4Z
	ttZrUrWPABSS9oLbpGOyN8afBvm9u5d53Hj+h2v6vV3AQwZidS298Q8z7CxYSQ80
	yAaBZZDfXbQ0IcoPlxCwrJiRFSF4ZMIGfVeiSGvufZ+hAYCLlicwJHBAkWGYEGbO
	rSBQ4+xtdM9MH9O1KJCLr8fMIT181Pq1qZw5Y++ACnfgxbTcA26Z9u3S9/7nOtCA
	qpdOS9ZJB09O2bWRpx+B/irGFFiO1dzoM05NfseqZmbs6Ic1I3htOtsbCzrldqLk
	e3406Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpx1ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Oct 2025 16:09:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78117b8e49fso13273521b3a.3
        for <ath12k@lists.infradead.org>; Wed, 08 Oct 2025 09:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759939793; x=1760544593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ss99cPPCtTuFplUwVBzHekqSJ/wYgBUqZ5l02AsSTxw=;
        b=YfzgsQ31Qgw7xtr+7o8p2jhALfQ1wCcSeleJ64VqmvTUNU/oVnNfvH8SyDwgXMHZz+
         QDFu9TltAvVT9n8PNkz2Gvh5VUIuF9CJ7/zVZz2QuQXGezAo/zNsmrm8FF6tY2TsDvYU
         0B3piqCUaORVYv0G+g/bHmmcHFYZss2faIIcBkkufKOQpVp1TQ77yaryI/zmAdue1v1d
         tqdg14JbEwsAaAtbVfJoTO8JxaGTUQ/ue9TybH6aHK0GX0tVcH4IoAGWT191umqHhaQq
         /q+c6VeYH9FGDNK8qhLeqSAYoaUof0I3e84QdG37pdcdwFHFMKLC4IpDeDqryE6fuP7n
         ueTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjXH0mANX0WfwxAWIv8OS9lA7GDi/kn1RH+xVV/SMjrItWvKZm4rpw2CQTHO/aPpY553SeGnA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUuMFdVwdrWp8vMUVjo7Onp4TDAOAWzgkPgButJCQx08Y5lnu8
	cAAbehHCc9Vr8gkJbvOVB6GSYwfO7hjBLOGByU6oUrxo5M7bzswgLpqhBQWGEyzwxBSO9bvPTcP
	OU7wbzY3Z7INZ0V7d70EOjrIjK/r8Bl5cAVINrGNyo7d7TSS94m35bh1XbqzNYroyG5xXeKei
X-Gm-Gg: ASbGncv/DUDsAUKli52hvFv8q1kwK67QzF2Fk+vHNksl/VX2OjswWHv9AKZi3Eki+Ee
	dSSjXLK6DlGewb0rnbYU73zvCQHGW4wz3QulQzzlYzFdnk5EwQGwbz4byJGbmHNozNK4NyT2oFJ
	nM56xuKPYhUjdTZH2dHoNPH/DdZbP/LWUV/27ZiPWHZ6A3VL9vGVkaT8d69QyY2r9ivijaYtgP5
	7ac7HrNgY9U5LFr7Raan3KyAM3TSvQtGY30LBr5jv/4BQhclO2YCpE7vSzmubCHyBHCT3Ne6nJO
	2mks++CJu3HGXnDu5C4MtCUtvZ4NxWdBCEJVL9bhI5LQ4SKBSdTBR39655wM2iRtU+Z5b/zcreA
	cTRgN5IUCD0fbs7S8UoZj+A==
X-Received: by 2002:a05:6a00:2407:b0:782:9b8d:24ac with SMTP id d2e1a72fcca58-7938743b234mr5062528b3a.28.1759939792850;
        Wed, 08 Oct 2025 09:09:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnZGiEiiUpL481qbqo4lG2Vfx4+WXoKcGF/ltJ7NCEBikGMrwZZ9xIlIltKP70C9AAwzEdqQ==
X-Received: by 2002:a05:6a00:2407:b0:782:9b8d:24ac with SMTP id d2e1a72fcca58-7938743b234mr5062479b3a.28.1759939792314;
        Wed, 08 Oct 2025 09:09:52 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.106.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e34e52bbsm120329b3a.81.2025.10.08.09.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 09:09:51 -0700 (PDT)
Message-ID: <40787b6a-f410-e780-05d2-058181d2e060@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 21:39:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next V16 0/2] wifi: ath12k: fix TX and RX MCS
 configurations in VHT and HE modes
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Baochen Qiang <quic_bqiang@quicinc.com>
References: <20251002000732.1916364-1-quic_pradeepc@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251002000732.1916364-1-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yFVJGCYhfP6zAu-NsUdfwnSpIuP1epUc
X-Proofpoint-ORIG-GUID: yFVJGCYhfP6zAu-NsUdfwnSpIuP1epUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfXy/Cny810wzBe
 r2GqmO6DBXySrirrEc1uOFteVmVLVKwwN0Kc1r/oLGxHXlJxtv92iGsSpbc35v6oElk9D0Q9iGJ
 HvF2Gw72OgP0s584Mg3IQu+YR/ajx1Bpy7gsoVFXdd1+T/lVke4KZU/n5yPXQ+kBHpQt5jtEOya
 RrTGXx8YT1wjJJMVHzTNAR2C2g21gkBar/JuRubvLRXlhqovVKFTh1rpZwV7pUJ6PHXwMl+XN8g
 zDlhSbYMJ3Tj7J58D+b1n9GDAC/j8XXZjoG+c+rOMYKt0CNtZxGro5ZM5fYTl6nd9SmiSKDWC0j
 cwQN6YD2iu297AuDGK1DjZnEb5Wa8mmG15w1ruaapls3HGq+inxyOfUrUmfrgLmFcdWP4QrzQUD
 eCP0AOvWHKw6JSJRJrM92cqbdvJZOQ==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e68cd2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=z6xreaRxtU16OQ9bEhv1vw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=yaquvNMiY_n8JpVZVNkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_090954_782100_3982C669 
X-CRM114-Status: GOOD (  10.59  )
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



On 10/2/2025 5:37 AM, Pradeep Kumar Chitrapu wrote:
> This is revision version for patch:
> https://patchwork.kernel.org/project/linux-wireless/patch/20250701010408.1257201-6-quic_pradeepc@quicinc.com/
> 
> changes in v16:
>   - remove patches in series which hare accepted already
>     https://patchwork.kernel.org/project/linux-wireless/list/?series=977538&state=*
>   - Fix review comment on last revision https://patchwork.kernel.org/project/linux-wireless/patch/20250701010408.1257201-6-quic_pradeepc@quicinc.com/
>   - Add similar VHT related changes into separate patch.
> 
> Baochen Qiang (1):
>    wifi: ath12k: fix VHT MCS assignment
> 
> Pradeep Kumar Chitrapu (1):
>    wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 12 +++++-------
>   drivers/net/wireless/ath/ath12k/wmi.c | 11 +++++++----
>   drivers/net/wireless/ath/ath12k/wmi.h |  2 ++
>   3 files changed, 14 insertions(+), 11 deletions(-)
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


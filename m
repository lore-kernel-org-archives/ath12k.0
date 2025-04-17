Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6A0C369CA
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 22:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qz+jktuaNe9C8iWX5656J/Frv6q0DtBvT/HgdKu5fbA=; b=Isz62bsgC5o6BXp6xRFtt4Mo4d
	JcVTOQ33dGUcEMNvm9G9Ohecye46uZf9qr1kHqUoUkhi3Mndq/hUuengffm6FcGD8uloAX9/ePT4+
	ACU3N3MqNFMlbRbqGcg5zDhv3VR41xPBbaTPyG4ScT7i7HOjKvpFaRaaxG2kUBotxtsyZUILcDgsZ
	LZZoIksOzhApxIylVtRe5Nn10065C3C+YkXAaogIXWkovx1cg/04RWoumCmhz5BuftBq3d5Q9WT0n
	nfDj+HpUDVe96GbaCg0Mu+QyLI5KPlA0ajajBramsgag/bbs+5kII9xal07/JfD/f0LJQ8/ymvqbr
	07t87HdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAw-0000000EVQM-0TRA;
	Thu, 17 Apr 2025 22:57:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAr-0000000EVNb-1evn
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 22:57:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClOow008153
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qz+jktuaNe9C8iWX5656J/Frv6q0DtBvT/HgdKu5fbA=; b=HivXcKTGs1ExeGPw
	uDBJv6OP1Fk8dIcinzKT8/XawVCeVqogE09SQoxnEJAhMBg2g96zW1tJ+b2+gbM6
	TtPP6+MNMG0I1+VY0qWjzM28gc2S4i/jYT6gJNYzKDlkLAP4SzG43IEy6myW2iUS
	4pi9mwoKRsfsuSutlO4Ha962bEVAsG+e0NTWfjwhrGrcDddeFTy5H7wnnW2jgh8M
	OQYy0hXbBPKNFqtIeLu4OuLMRtsMv6kA/igVwWWtfXeRqMzFh+9h7z1+JmBUF9yz
	ljWkwgIkvctwnGtDaGz3Bj4AuUKrV0w1PTJ0GjEBBc7O2z6ShhtV8BAZJC37Y4R5
	JWZjUg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk89fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736d30d2570so1080179b3a.1
        for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 15:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930656; x=1745535456;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qz+jktuaNe9C8iWX5656J/Frv6q0DtBvT/HgdKu5fbA=;
        b=tdy23oiIL7pVS3h0WFaxNtUj7HAflNxTwg86p0Z/5eqyZoY/WJyYGGu3A2u76aIIIY
         sTbrFbOEufMll7ijtpKvyL84Oq4mEt+hi9aGXps8iQcHbZ7fDPKCySV+uGPMvyPp+rMc
         LQzgDzG2v9YSGXOaUsalW8d0ZsIV2mMxlrJ8/4Kyff06wSLJQsDWXnwjQGtZDCD8aDqq
         1A05f19Hs3ZFwH739vW2gYmXtUNZaJY4fKFrcCD9SAvjplDhibsXLt7AC7KWQ/w+ZJRo
         41L5qN4lgU0xI+hmVFJb/Mvx6jGQDFuRUQ9muY9v7QsExHp65Lpq5fNvktQIkPfUd7cs
         hebA==
X-Gm-Message-State: AOJu0YyGX6c+QKb48+pwgS32+sigu4ojAWgpb2T0qWx6+q+EslHpkK8C
	3x4gYDawZJUUVDeDR/c6nqf8LuI++Yje0cNgXK3rAtYhb4Fj/pp7gDhRGw/7gWvYHBrwOQf/UUE
	LQM5us6u7Pl+kBv/oaGzQtYgVPNtG3lnfas13VyT0QabVPTRySSiWIqZXaPbG
X-Gm-Gg: ASbGncuPAA+IZFpzl4CNJ+1vlFVW0tslpVcxu0ZiZSBhbpBo9h6EklJOjGGqP1jOAuM
	SvGrlQNaGtc+DRIJ6r8xmb+000fskeX2TiMtTK4iYvhXhmraSnlMrIBe9e40bI/ZgH0Ui1B9Nnn
	oN0Ntwv5+r5oX9+RxiD/G2AxomnR/Ws/jTXr0s7Dk1I+mmM8z7mLiXTL7eXFbrgDnr5alfb17QD
	vfyls3byz16qOyeIKvY8tx5MNWkYkwNSy2pE71sUGS8L6PaOpucLhlRKXV41GDmSJrnxwpNhKDF
	Q5Nmd8+yUI3TpCtj6QiMrXZ4ms0LsCJDv1+hR+8hRJ5KQIIG
X-Received: by 2002:a05:6a00:14d2:b0:730:9801:d3e2 with SMTP id d2e1a72fcca58-73dc14ad1a8mr841605b3a.8.1744930656093;
        Thu, 17 Apr 2025 15:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV0mSf5Bn3WSEcs9dnuFc35G7YUOqjB5EWQYGDI9UVaxSfdUrIbHn5m34UnpiPhNvNjAnZYw==
X-Received: by 2002:a05:6a00:14d2:b0:730:9801:d3e2 with SMTP id d2e1a72fcca58-73dc14ad1a8mr841579b3a.8.1744930655608;
        Thu, 17 Apr 2025 15:57:35 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:35 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Sarika Sharma <quic_sarishar@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250408045327.1632222-1-quic_sarishar@quicinc.com>
References: <20250408045327.1632222-1-quic_sarishar@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix invalid access to memory
Message-Id: <174493065499.1347382.8547356391304429074.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:34 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=68018761 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=0XJ0nkoN6fRkH-oyq9IA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: MfIg7muF7RcoIFIxG8BozZotw_4KqB2W
X-Proofpoint-ORIG-GUID: MfIg7muF7RcoIFIxG8BozZotw_4KqB2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_155737_440918_D65C4734 
X-CRM114-Status: GOOD (  10.11  )
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


On Tue, 08 Apr 2025 10:23:27 +0530, Sarika Sharma wrote:
> In ath12k_dp_rx_msdu_coalesce(), rxcb is fetched from skb and boolean
> is_continuation is part of rxcb.
> Currently, after freeing the skb, the rxcb->is_continuation accessed
> again which is wrong since the memory is already freed.
> This might lead use-after-free error.
> 
> Hence, fix by locally defining bool is_continuation from rxcb,
> so that after freeing skb, is_continuation can be used.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix invalid access to memory
      commit: 9f17747fbda6fca934854463873c4abf8061491d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



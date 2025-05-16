Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B146CC3ABC9
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 17:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTtm/d8DLV3214L4Iawe0s7r2k5QONABJ/WVp3kJ2is=; b=zbMUc/yn8D4E+nYfpFupH5O0oz
	dcgTZ3aYiBdWxp/7/frxeyS9GjOYoz1IZhN1qwngvWWOX8QdFOmGk6Ehp3l6inbrIz7uqnTmIpZkZ
	Q/iFKEoflnwFl4JVuzx6wxodWYSHCg/9sb6TGwKSxeLiarKRrL/28IrZmC4fURIHSphk4tMwPxv0u
	M4yVU0WwmgcKjHwDOR1AfKfYNsVV7OV3kqUPotNG56jweqIFKEB0q7s3iOpS73aVuBQeO+MiAqV4c
	8G08kvK/+VtDYBNL04P8D+YqPbRzpK1azU78iYYmB7bvXk/26ezKYOrGSC9w2nUERA7ussijzVflC
	FeRBV/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFz38-00000004BoJ-1vMB;
	Fri, 16 May 2025 17:40:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFz36-00000004BnL-0PAM
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 17:40:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GCpmfG013922
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 17:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTtm/d8DLV3214L4Iawe0s7r2k5QONABJ/WVp3kJ2is=; b=BqVr4qZvreveU/Ac
	3HPaugrRH6kdkvrZ6qzxFepCWe5JPtgRqd9bWIXleMrbMCotzoBOw7OIqFvLzE8f
	VIaeDUDZDDKghIdYDzSuT4fgTe+AEHMg+ktDNrKcJ1Tt65oQzEgwq0zWcEP6TqbX
	/ZrenOybpff9vD1HcTaMRuY0Ey4yeSRa0aFBprUp34Y9EzRthhug54TmEorCuKjK
	oAUKxh86qhEDPKd6oIDqiNDj9bsLjL/zMTOzbS81RCCqFdwek3MJiQ5YJo7jeixA
	/Y5McjOkdpkXfuHvVUxwflrYv/D+fqmq1X5C7A7qrPXX/EJrWdVehVczbDGVuh27
	UavJMA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46nx9jt72u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 17:40:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-231d7f590ffso8191855ad.1
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 10:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747417242; x=1748022042;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTtm/d8DLV3214L4Iawe0s7r2k5QONABJ/WVp3kJ2is=;
        b=NOkWXmLXSFxSEKtrJoHB+T/Oacqw9w1JMnZKfJiasHp4tt5KKqnPAbrxPIwYpsAFGn
         KDdkmj2Qj98izRDZASD9YvwwbmcEY5+wcFBL7Q1ca12mKOO0vvZBKyU96DrvpyFW/JKM
         zvwbOELSYqEnCs4cwV5uGOv51jx8O8CPN71YGEn25BHY2tl1TkJ12JtZIj5AkLuUc6zU
         PQX3znprv44p23QuluWoRlZDB1VH03mniVX4uanvf27xkx4sCYLlGgUbaZuoWShmV6Dp
         O4M3ENAJZE6mJJ1ZBWqedbUzkJSRk7I7zyh75z4ZdxTN009uYhyTkIkn+D4ZIjYxD9WV
         It9w==
X-Gm-Message-State: AOJu0YyRXSMCp/ASK9SSknM951xeWWn0eYvDe9cusJZP25QnCz4xxVSm
	q774jcHn5CjmNS4M8gWGpvPGMjfHJeg9IKniOl3cAGLZko9OEoB4CTusksu3uMff5Qu9Hco+mN9
	e4PzjzK1nVlrGsCgl6Pt/ImfdH6ZDJnN4J3Oyd3Ap/xD8EJtCEfHurvFeov/0SRrS
X-Gm-Gg: ASbGncvPEmEy1Yf/6JJo5t6CClToLrb9opQhqc0uY4mS4C2t61IAU4yWzGvglGUrSEH
	AhdCuwYbmnyUxEqey2tT8Su8lsywIyN6Nx/7IvUtl5oZehFu2v+MUgvSjCWdVT/BGlVs7TZ1h+p
	iwf7GVcSY72HPxjHJF95QtU8uRxk+GNSa1DhJ0yyTLs9Jq+FqwNrK62tyDkMPPEIqKooxJqAMLy
	HyFP6u3ECCIPUaL4yvG5HkdM0bvx9+UxyBypk/BDBfR7yIGET3aVmLDPRpJLVm7e31sQbc/kd3P
	MzLZEC50YHw3pjLpFxpFM6L/ONCDuJ4/MzteKIGR3slaW95V
X-Received: by 2002:a17:902:f706:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-231de3001cemr55969945ad.12.1747417242641;
        Fri, 16 May 2025 10:40:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFobjA5XqcWBEK9A60Oy92wauWosEM5AF0oxH7QCZyrE4WDwFY1aAUoCQNI/WNT4jVB2AuQlg==
X-Received: by 2002:a17:902:f706:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-231de3001cemr55969655ad.12.1747417242233;
        Fri, 16 May 2025 10:40:42 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ade573sm16994125ad.80.2025.05.16.10.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 10:40:41 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kang Yang <kang.yang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20250417024227.1712-1-kang.yang@oss.qualcomm.com>
References: <20250417024227.1712-1-kang.yang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v5] wifi: ath12k: read country code from
 SMBIOS for WCN7850
Message-Id: <174741724095.2935573.18062919254197960306.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 10:40:40 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: sxLask4OyEgbnGM-eCv-x0JbUyz_a5za
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE3MiBTYWx0ZWRfX94SGzP0d4qcF
 C2GMSrAdiLFSUhvBXXg2TyLnURu9XcEqw7hlSwv0F4MxyDjfnPG6dtzrfRwQ0QbjeIKBvBfcbIK
 PJxXlqlZaFrn211X36O5bxGNHxime+n7I/G6xHlhaKtsU+LS5sgJKRLCCc4iQw6H/xfaC+j7WtK
 Egooe4H3sYzjlkJskQU70EdSJgAEHxcubkhStYOEoOyHUcuqJ1QDtqB+dQIwmUzwvtdP6TUxujk
 Xmc3j78bIq4hwmbDSUNvkgQjK9Vmqxt6yyTIgqmmSXYAEcb6tjlTSd4iyTG0y9Dx/hUyDw9vtU2
 Ygj/tLwSalPvQfRvrJ7uqXhXyOtVnuA6F4h77GT6GJdJczf7V/+O+xQOzfADyDMALBWEuB7dfw6
 ICSC1nC1rn9ymRRaY0DE/FXOHxtgZusltuKbpJcOwIn+ehy1lCfBhpU8VRqixgGqi5JovqQz
X-Authority-Analysis: v=2.4 cv=CIIqXQrD c=1 sm=1 tr=0 ts=6827789b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=lGko7cT-K_rkadHLPgkA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: sxLask4OyEgbnGM-eCv-x0JbUyz_a5za
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=832 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_104044_150761_D5FD5B70 
X-CRM114-Status: UNSURE (   8.80  )
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


On Thu, 17 Apr 2025 10:42:27 +0800, Kang Yang wrote:
> Read the country code from SMBIOS and send it to the firmware. The
> firmware will then indicate the regulatory domain information for
> the country code, which ath12k will use.
> 
> dmesg:
> [ 1242.637253] ath12k_pci 0000:02:00.0: worldwide regdomain setting from SMBIOS
> [ 1242.637259] ath12k_pci 0000:02:00.0: bdf variant name not found.
> [ 1242.637261] ath12k_pci 0000:02:00.0: SMBIOS bdf variant name not set.
> [ 1242.927543] ath12k_pci 0000:02:00.0: set current country pdev id 0 alpha2 00
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: read country code from SMBIOS for WCN7850
      commit: 31d48b93b1f8697254c4d7fa922eaaa3b28a7ab8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



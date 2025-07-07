Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89650C8303C
	for <ath12k@archiver.kernel.org>; Mon,  7 Jul 2025 22:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lc25Qjwnfvt0u2zQ9Wx0LQMuHkbZEWUV53BxT0Htayg=; b=fjcyEiWrlMNIsMz8uomCyLe+qy
	gZS7h3ZcBEe7lWfMcq41OHOkA9dIs8V2dywq8HuC7uJrIakTwPYGLFej8DG3+6BkHaoa/7ddRMNLH
	DK70qeS2CUwIqvGzrcO+h8mv7JuC+C0oDw+cQ30axP2Y3ALdkqheY0xqe9gDox+qXmRhbzTTPMGzZ
	WghCZ2r8T5o0cWfcaVFw6I+7jotNMdl7eEumOZDUmOjoRXZ8BYo6iRMyv6CZoYqw7nebDefDToY0L
	9O3J8rbVXzWPK0kouz49WUQsRDF29EpRp5fBVXkS81RVU1DurpqWRmoBG7NGXAVn2j4HrZdHdobPx
	USkaPwtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYuRp-00000003igM-1Ia8;
	Mon, 07 Jul 2025 22:36:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYuRl-00000003ieK-362v
	for ath12k@lists.infradead.org;
	Mon, 07 Jul 2025 22:36:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567J1sJU032457
	for <ath12k@lists.infradead.org>; Mon, 7 Jul 2025 22:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lc25Qjwnfvt0u2zQ9Wx0LQMuHkbZEWUV53BxT0Htayg=; b=T38S0DtiMHYGXEqa
	0xGgXLSxie9P+i/AWF5gueylp2Ig3fJVfHR648P+inyQoGX+whMPhVa2GKMQWpWI
	GGSN29ZEiytzcUXkbOnt/hVTKU/ENgBZg3J+49uRSdimtKuAwfiauK/BXO4eSn61
	5J8EpY9lMwSvwNxz3gcFE1EQVzNvWi2yDbf8NgcwZzKOhMXsqkVCr6KfZ4weAR+/
	l4H+pd01MOo/75gO2/fV2I4PnyYcoaWv/0VzGe2HKNdJNHrJkD7PCgr16yzYQJjV
	CLYn70pV/Yi1VWqjlEwLSvnaVZ08fW7FZWZCxL+MDHrEfV6Iv51VkjmpbOqbUYPp
	XE1I+g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqsefu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Jul 2025 22:36:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748e1e474f8so5651368b3a.2
        for <ath12k@lists.infradead.org>; Mon, 07 Jul 2025 15:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751927784; x=1752532584;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc25Qjwnfvt0u2zQ9Wx0LQMuHkbZEWUV53BxT0Htayg=;
        b=O32wu3qUzgI19j0YaLjo8NX8Je4rL9nTeFrmUetdDQuR5EMyq9JvLLZKc9AjOTW5Bi
         O344iVswE44vvfxMRf/9P1NCRUYY5sH+9gghoKP127S+T30iMhPoa4xGZQYksJ4iQ0qb
         x1c1AN8vY1xFEJnHOnF0bzxgHQDMHSGAQmHqPT/AaMuZ0lLCZfgNLEa7Vtx3BpJySv5k
         q8OOT7RF9FYyF94xGr5rilVBf59vl5XGNct7fXOcSAb14bDqBKBOuhJXTGgXdcw5UROW
         hMfhlof6y5YR4uuvAInBGvmxhM62VEQ1p4Tpt2a4EtErGNHrHoMSeDSL5JeqJrnzGYkQ
         yHQQ==
X-Gm-Message-State: AOJu0Yyq9W0awzuyx29bFy2M5X0hzMAFomBhjdgrUZLmlh6AUtGxEd4w
	Rl4FSbALvfFjLGgEvbaCDFieC5ROcdPitra5SDwNdjHYdiqH/apLmRP4vH6fkW69ydnc6IoJ+6m
	knafVQtDLCC5G2MbX7qrtokFh1qdoGSDtShZkuDkQxhFGPRajbO9X1SiJkLtoJRGF
X-Gm-Gg: ASbGncuVOgHsgNF9Vc3Nn5p6+3O7/NvrwLyTlH8vbRKhB5vOYzenyxCARLvmErQ3AHD
	3wiZaQopw1TJv/ztxV0IdPxZpmKqEaRTrRe6cyCse8ddhY0EXNgXJZsUChqR/UQtSvTWALQsEqK
	JD3UIvJufyYAVpT/7wxGSvUdlptsTto9eYiytwegNuDsB9JJZuUkgAyBPpDjXxvVhUeHYohdiko
	14vOFr1SClexfBbhFAUPGC2Ts09xF90RRAfLFGOMAiYraf5gPPsjitz3AEr3GNivaEW3/PsZE1w
	5dmaLItFKIBUZM6m4Cr36R6CiilUhhcTXQ/GDJYAhe2YybGbHLks31tkQ0Q=
X-Received: by 2002:a05:6a00:80c:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-74ce6668f9cmr20162811b3a.15.1751927783635;
        Mon, 07 Jul 2025 15:36:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlQhC/FjcP65Oq+8yL/bUuM4aCJUB8cIi03p6MIQJcq0lGnx4KtSGyvPSbuS9hy/72KTpzPQ==
X-Received: by 2002:a05:6a00:80c:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-74ce6668f9cmr20162788b3a.15.1751927783220;
        Mon, 07 Jul 2025 15:36:23 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee6358edsm9668064a12.58.2025.07.07.15.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:36:22 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250630031502.8902-1-aaradhana.sahu@oss.qualcomm.com>
References: <20250630031502.8902-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Block radio bring-up in FTM
 mode
Message-Id: <175192778247.314276.9568519823635230808.b4-ty@oss.qualcomm.com>
Date: Mon, 07 Jul 2025 15:36:22 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686c4be8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=wy0no3_6c23iQZEdgM8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 7jlVEsw-L8CpbVtEfHCUjSRNTnPND4-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDE1NiBTYWx0ZWRfX14H4PB+R+aXV
 9YhXiFmaNnBRKpbOxcCCHlCrafotbrCmOXPnRjs5/5vfqd4nYeqQKRO3ha1UTT7oO7g+t/Zt/Jb
 JMJ64fn+X5aiKVFuLnPn433DboE43izPZU/YO+JxtH7/taAB1dLvK49dyFQAjEyFuiSIlWqoXYr
 Y4U6ArHFB3WINNKYUTcFn/AGjr4xV51ECVdvrAqVPRyoWfK/NuuClSv46agS8Ns4h3oeYXSoNIp
 mavtBxXTMJxXkQOZjwhi1nk8UbAtS88hXBXZuekAbWSMPqh+vsTjZRPhvL6h9CU8tVDpTh+DxBK
 vVk+EqDGCKVVmQpgY9wlpyHLLsbw1O7ET4CvJosGlS2ngQu2bPceGMXIFfHG2craGyj/8vtlFeb
 Fu/F9P1+h4E4RGmCBgtqToHCAkZK6N9waM27RwIRcCoqHwWCsAeX3WZZY4uRcrgGp3RCBfMX
X-Proofpoint-GUID: 7jlVEsw-L8CpbVtEfHCUjSRNTnPND4-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_06,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=751 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_153625_902390_709B28CA 
X-CRM114-Status: GOOD (  10.75  )
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


On Mon, 30 Jun 2025 08:45:02 +0530, Aaradhana Sahu wrote:
> Ensure that all radios remain down when the driver operates in Factory
> Test Mode (FTM). Reject any userspace attempts to bring up an
> interface in this mode.
> 
> Currently, the driver allows userspace to bring up the interface even
> though it operates in FTM mode, which violates FTM constraints and
> leads to FTM command failures.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Block radio bring-up in FTM mode
      commit: 80570587e418f361e7ce3f9200477f728b38c94b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABC2FA1FED
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 20:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWNv/n77xtlQNACjJ3+8jJLYWYV7KxtU3j5KJIFZm9w=; b=TU8DLvShT3j3UHI0wtM70DC3xu
	BOd4ELURd08M177Dsz+BjsoJ5bQaXFnlrMlMaKb5jA20A8enJ3j7ltyet0x/YVrorvrLxtT3rou5v
	U7VHHbINXkIsL5TGMktgrWrNQSoqmYNQVN+zOqywXzObBA96JBDTJdrlzzkvPnPunlBc7XpCbF/L7
	8or3MK3Z4S0nswyShOdR9MihOzBzkW9GEBW6MsvnXExl/JizW9uVnYO1w8vKpT1cxEHpsbDRJ6j2g
	uLIubHudJ8tK1PqaJQU586JbzN6GkWe89wq5U6iZlGVBIxEN3J2dzYdpo8FY7hAtiUF9IeooasWT4
	TfRzq4Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFdo5-0000000AhmX-1p9k;
	Wed, 22 Apr 2026 20:04:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFdo2-0000000AhmC-0PGV
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 20:04:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG5IlL2185937
	for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 20:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TWNv/n77xtlQNACjJ3+8jJLY
	WYV7KxtU3j5KJIFZm9w=; b=YtLDY9uF5xOkCoR8E3Hapt6dWg8lw9y4CViURo4X
	3sj1xGiBYjfiOlGRP6eA/ix80qQtgSD5BDXQ3OUdZi2TY8vDwvtnHONVZG5N4Mtp
	Evjab88v4Ddg4qOo+pRr/xWx9Ns8qPgqG9+E9Y5FUY1c+m9NyDi490VZ+5rT9V3X
	rNy5DzOcpX3JpNZdLuhslsk3tCP+DLqiJIYsqlrsEn3PjEuWX87GqgAERsSGEPLs
	4Q9NPD4F4ixz33UAUspYkKvlTw16b6m5PgJ3Hig/XunesxrltP8r2sSMMsafu2is
	qNEkRl9ZPlkFePAbtM2xVw8xZtpC76DJp4eX5vb3NdhhPA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hvgv39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 20:04:17 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-956732444ffso8879121241.1
        for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 13:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776888256; x=1777493056; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TWNv/n77xtlQNACjJ3+8jJLYWYV7KxtU3j5KJIFZm9w=;
        b=e0UiwoHpG0oxjxuqbSk1+Iq2hMdZ3TLq5euJRhG5ppdRrTerWib1S92mtext/x1qnb
         05Qdj1sercQdKN4LFjFrkFz7mfx0xxvpP6b9cYB+qfCKz13Sm+GI9GbNk+eNmGH0uHoH
         azbgorK7T4NiWZQVA/wrpZejRToiMz1v84Gc9PVXTEIL3jDB0v/nPh53phy0Yu1hc25R
         NYfXVLghw4AXad0BJpx8Z8tXZ9isrvKvvgfd1GG6OtpEIqa9ahADoHbLG+vG+W2rJnMQ
         ryT8kL/N8urBOurrSUV7B7d4eQwTcsjYj3AIyAke1jir15SFyxmnfR0pWg/qvuybZbcO
         YaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776888256; x=1777493056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWNv/n77xtlQNACjJ3+8jJLYWYV7KxtU3j5KJIFZm9w=;
        b=A7a0vm9hRwMaJGSCuBHM6JaWGplpeaS+DGHfE/+b1fvfkLlBMzCzy+LtUYeIniiFsi
         CZG/0qZrjv++5ifzENbC5JbTQgCXjxxqWXKAdTvkXkendxkwYmX9yt4ZR91OYOXo+wiK
         uhBgfos17QNW5RLsq5i53YEj8ro2SNyf4AlY+kS4zZlLuz8HbaW8yab4YeK1MEk9CV8S
         i/JfrBX0pDTISTbDr12Gu85vyHFcTXZ3lc9M0Ji10W2eyjyj9s7QmY9efibTc9sPFcxo
         XmO1w32b6ijjANDSzebLkgqJPJkKjCiMnHK8uw1Bv8LHDtad3/fjB+Km5s0QiChW/twt
         /VTA==
X-Forwarded-Encrypted: i=1; AFNElJ+OJr6885cR0VuDNLxWMsf7R+jrPSaddlOnSFLou62DD6B5G5NcGvu3Sn2Bf80irwOOzDwB5FM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGssbmw2ZgW1FtwCVhIUc/cOb9QavFpVJ8/61UqLBaN5yPckGa
	6Ycm/hIFiM+zTNP5Ez2qP27AULUUesxIJ49tMuSPQ01pEvjw/rEyXayTAWIp5ZnRwi8uCdTPeNO
	Z32H1ZtKjSeA3bA5Bf7RIs61iKnjzdlXd0w1gOkCl1gKaV9tXue0H/CmwWU67J6xX
X-Gm-Gg: AeBDievLvolYWNl7jkVkwMdQ0odwEr7/+BTMks0w5783sdqUFAyFOCadhuEnCY152pe
	SZC+/C9zXAEd8XMotxizQpLnc88EWKVqQ1NhrKY3PKAKox3+pzlDfPuMfqKc9bYFTxKyb26Pqac
	7HcBf4667Ltr4bFCjG6ENOT1CkdY48G2zQAw4N+hpWDxKaocHsG3bYaRtQv7xSOprP/zDE098b9
	KH1Z3La3AfTWWy4Kv4GlLfdvyTLLcyNNKZzvlLgPvSEu2WHSBKPMNmPnYX1tgMMcecREaP5aLBi
	Th2x4ad1PcCfYEwvb8oVu4BJiDyebqwfqgG51T/D2A4GfT8gmUoee6xUrY7x0omrDCHhGU+CK7O
	nHqvlwQGU62VIyPUyI15XRwFcX6RTO98vOZhZ6ELgFwnty1uy+hr4ogu87b6OqhFTgrnMMZloOD
	M4i7dJ/Y2CLM56O66DX9OKxcu9QEWGCBOHYLPyWnQ/Nps9gA==
X-Received: by 2002:a05:6102:f9e:b0:609:4d86:77b with SMTP id ada2fe7eead31-616f73fb077mr11984438137.24.1776888256337;
        Wed, 22 Apr 2026 13:04:16 -0700 (PDT)
X-Received: by 2002:a05:6102:f9e:b0:609:4d86:77b with SMTP id ada2fe7eead31-616f73fb077mr11984380137.24.1776888255894;
        Wed, 22 Apr 2026 13:04:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc25csm4689196e87.26.2026.04.22.13.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 13:04:14 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:04:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: lumag@kernel.org, robin.clark@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, sean@poorly.run, akhilpo@oss.qualcomm.com,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, harshal.dev@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/15] drm/msm: Switch to generic PAS TZ APIs
Message-ID: <fuypqlwseulyvlsgiq3dnh3kwhernjid2yqljiwmrxufzfuukq@mfy343uq5gs3>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <20260327131043.627120-11-sumit.garg@kernel.org>
 <aeduRrAMOAW4f5TU@sumit-xelite>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeduRrAMOAW4f5TU@sumit-xelite>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE5NCBTYWx0ZWRfX6ETLHjjoM1fM
 XgePdQKa+ZkcOd9QF1f1nham0b7ccs9MRVyOWXwj7bYi0dPp6EWU3rQKCSa1eUF0BlBeLqrXS42
 si1lY26K372MPpXnPOmp9UZO7cf6zVJPqyAI+q4NnKLFYMnD1X9+VRSvGEcg3UGjJLCWR0qPhFq
 5+U7ABLy8A+MHsIv6xNsSvPwDFun41JUyOEKT1ynL/6Yb2afG5DDLGvq7CXM39QjgBOauuyTZr0
 /kQsc01uiz183wUAN7pwCIRFPX06yM09QXrrHnK1+gjH9JSH4yYNYmWfTSE3dRGeW+wRoREuUOj
 zx0nzaTCTxLxJXMzCRjATCPg6xlhgpQ2a5fY64KHXx/gpRGlU29XrZD3lvntK1y9r15HgHlY/RJ
 5m2iRgca5QJGiFwhC43htaz66Rfz9eO70E1z2OCfLZmD3TkyCFX9h8ZPM8YEYahd/YlG+QZ/sfP
 myhg6nRODQ2/0zwWTog==
X-Proofpoint-GUID: bHZ_8RDoK8LurAiQGvgAcicCK7w89oNC
X-Proofpoint-ORIG-GUID: bHZ_8RDoK8LurAiQGvgAcicCK7w89oNC
X-Authority-Analysis: v=2.4 cv=HJvz0Itv c=1 sm=1 tr=0 ts=69e929c1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=dgZ2eqGgcVFd7X0fNysA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_130418_143054_BA8BB4F3 
X-CRM114-Status: GOOD (  15.38  )
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

On Tue, Apr 21, 2026 at 06:02:06PM +0530, Sumit Garg wrote:
> Hey Rob, Dmitry,
> 
> On Fri, Mar 27, 2026 at 06:40:38PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Switch drm/msm client drivers over to generic PAS TZ APIs. Generic PAS
> > TZ service allows to support multiple TZ implementation backends like QTEE
> > based SCM PAS service, OP-TEE based PAS service and any further future TZ
> > backend service.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Kconfig             |  1 +
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++--
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 ++++++-----
> >  3 files changed, 9 insertions(+), 7 deletions(-)
> > 
> 
> Can I get an ack from you on this change? I expect this complete
> patch-set to land via Qcom SoC tree.
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


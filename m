Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CB7C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 12:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWECIwdx2FjYu4F2Dv37YsQcOFv1h/HrdIPZgZxYiUo=; b=zvZqumG4kGeyAE2F2YcSRGLTAK
	0D+MCBPmPii1edpLU5TEkRJmFvOTw0bDvqbNUOpJ1CLpo3mUijugch23UVhbu6iZSMNngx/tJG2Kn
	LqxCaG56yKw4hrKcVC7Q0iRU3NBDLq4xHRf+i1wjOMQ8szpZKahqcWr+UM7UTq7nzyjS8TFbL88rC
	rwM/617xFUkQHu53hxFsmmqw1rWKWDI6yI4xpn7VgFlt8JZGIdO5EL62n4I5wlLoOILpKghegdiIu
	5/5IzarkPHAnn7EmV0zoMrP9rclrBZP5+Nq2E4WUHrrczPNHTQ1OylQRQPTKHdgR7cnq2nKsdAh2T
	KpTnQI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXhe-0000000H0Jp-3l3w;
	Tue, 30 Jun 2026 12:36:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXhc-0000000H0JM-1LT4
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 12:36:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nLSN1590866
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWECIwdx2FjYu4F2Dv37YsQcOFv1h/HrdIPZgZxYiUo=; b=hMAv06XB7kVL6dKY
	+mHGw3jLF/V8VbrZUImQfj2Obz1kqidz2H33ovgOc19u+mb+yDLaOpPN/kUCihqJ
	VxyDFRhHHF3LE+BMpwV25kokDuysV/+xRDcxCR/nksSgx/Y98VucDYD/N4RQvqAS
	RfzOiO2B+ckua6pWwG5ZmOxuB/BsGWc4mZ8/uTlRsGQW8OZvq0FVIp5Rwvm2/qnM
	rHSsXx4FPnD7merqI3IYjqYhb4n5YQSq2ebVHHhxuIgh4ogpK92nyJAxaWQOyjrY
	yPhPlQTtcEYNELxEP7xiMOsLVXEo0PekJnEHp1ItAwYxkBJailhxbT8YtECLlLUg
	7O5slQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3hwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:36:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e69a569ffso2634885a.2
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822995; x=1783427795; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hWECIwdx2FjYu4F2Dv37YsQcOFv1h/HrdIPZgZxYiUo=;
        b=fLQ1IRDd8Cmcb/ynYE2tpfjGwvJF4juX/gMBBGwUfw0Yv41wZy+Id5YCban+cgh3lY
         8SAhVdvRae7avpHYadYV1KIwJ1ad4cbryGsHHz6NHYJTj6hH3y+b/buDI4atL+8GO4yn
         L2v8y77iX+fKMGQo48mgwQ0tt0FMp0uEtMurmckYqDAXqPzluSFoGWIBUAgvr12EtBr/
         Ux/74VZzIIbDsWE/6Vf+5R2WCbfIrfXy0m3g3bHlSRiX0w8sOSTPop64bCwTUl6D/Y4v
         VeFeE6jcavhBx3sSiz2jYKgJ7107NghIcUar0f0Qf36Gp6gBsiiTEEL76mlPgOiLIBgH
         nQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822995; x=1783427795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWECIwdx2FjYu4F2Dv37YsQcOFv1h/HrdIPZgZxYiUo=;
        b=WLtBJ70jKv9nVK2Pnv0V3XKdSRqvZKdj9l5wM/wwt1wp8heJ7/XBd+6UHWlKjxNfLp
         klRTDS5g4sYfoW2czsAu8YTHzcTxUF5mEYZ20Ycp8IOnLKX/6KudLOORziA+KZuGIZim
         X0dtm81dfgAQ807+mBu2jvnfKvIQx0vMjfnQPEZ/q0MHFeTj73iv1p2NyGvw27b3+uYw
         iIgwyUIjxg7lMvqBYGpwT6v0xxnqRcjfZ/hB9ieCMFyIsleO+1FuCWGtT+3ROUt5LRCc
         6FR8zQ7B3KxJgPQftVMt8VQsp7sdvh+m1mrHC0BTe7pgOstRAXzQN7fNmFDfDeOoC9UU
         T1VA==
X-Forwarded-Encrypted: i=1; AFNElJ+75X8JU5LMIlHcp4GnLnD1KCso/ETZ8RGPOVhLRBT88vP0vo+L/YxiKNq78f/BMdBXY52GhTY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaztmM8tVWC0ZWblLqBeujhWlbLBragHQRM/1rO0ODKhUsTzO9
	tB8jmBrHj2srD7Z2PjhDyXEO9aJFZhU1xKn935kliJr2x+FcURF7wsOChYKNUHM4PftDTe04cl1
	SRoZiyQcOVS/yfZKyn3lDF25lETLU8RWzHHEsfXPFjw6ohjowWubBV+B1TMKYG3Ru
X-Gm-Gg: AfdE7clwz8BPka0sgdKHjnBpSLhcVHGyRh2CRPxUeUduJqqEXAa7jlmN/P1af33zByG
	BoZrXAgzUGa4Ax/7g2OLIY3XWhVRAeIlIVQEncM46PlhoJhNXFeXzzwycfiu8Jb1LSOk0aZqg7y
	8GIan9TmreVuNlw0U7V8H7ZrVzioUZy3jyAl+wt/XJAQl0Hgr4tT2jWUs/M0bhG5Hate5ROVBQ8
	kkkU55/EJNvmM+CqmBhN14lf0JzJaSzt2AAgRzcDqWBFv5C+jpo7aTLgLrFbqQfkvSuf9xzAwLy
	UmL+8WDgi37FijTZcQPMGC5vCQAD9Mu7horq0Ppni5Ob1lCraLFrDwEmdxigcVhDnrHcz09I+Aj
	odyCPtYqJDJbx6KpoMsXJWg8Q+YAv74B5bHE=
X-Received: by 2002:a05:620a:2a13:b0:92b:14bc:7936 with SMTP id af79cd13be357-92e6247af35mr377075385a.1.1782822994724;
        Tue, 30 Jun 2026 05:36:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2a13:b0:92b:14bc:7936 with SMTP id af79cd13be357-92e6247af35mr377067885a.1.1782822994089;
        Tue, 30 Jun 2026 05:36:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f48b35sm115852066b.46.2026.06.30.05.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:36:33 -0700 (PDT)
Message-ID: <6ea161a2-d959-4028-8aec-175b73df18ea@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/14] remoteproc: qcom_wcnss: Switch to generic PAS TZ
 APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
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
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-7-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-7-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfXxtQ+YhaGk9Vh
 9FxzKjrKF4IAwJc2bI8u7U2dYwCFmWrEbRTqWTJMeTWgW+RfOTrL95LYfHysxM2Cl5SKoeRvZ/c
 6MqMHPfd0SsUu1lVm87HNF87QUCifKc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX7cbgewoQXboc
 ByPPRGMVORinaf7YAEO0vwBlXZx2DL9PNyuxXp+0SoktbLs1yeU9nJgPaqPjJIkQi3OulPvh0/W
 bb6JrZT9g1YuSlFKezpO8iYjez8oKG67gUC+QpZ3nc6smZthGh86i5hsD4mON4K1RyYVQ1EmTdT
 VG/8NqrZz+6es3fsVk7JVgVJIjTmWQY/0I5N8sl4AQ92+L50zuZSY2ZrkVrlKgIuS4v43IvZ8SU
 Uk1trAf6GnTf+hZ4rk7nAotjhCAWSFtA/oxZ74IZ3nQYd7yuOaG81bqr1ffAnGJyEabkdr2VKHC
 ucyKXQRCHxpL1olBYD+wre2GJUT470Q3rAKWBp4bxwLz9hpuJmjc0/nLN9mo0SNwcVY6YLWg+Hj
 CbkHQv+SWkm1J8kTF9dpVWxTCVftZsuWhjnWOiQrTwB1blWdMP4R8j1y2j8ehlyxOBIV8fwtneJ
 3aH4uPhVdcpDL0zVx4g==
X-Proofpoint-ORIG-GUID: SwKIq7G2TcxoBKnmEV8OeVQCxxodiAKa
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43b853 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jx0KCs2Px1p7SxVd6dwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: SwKIq7G2TcxoBKnmEV8OeVQCxxodiAKa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_053636_475792_2BE78709 
X-CRM114-Status: UNSURE (   7.89  )
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

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom_wcnss client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


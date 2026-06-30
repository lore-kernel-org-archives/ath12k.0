Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2C5C43602
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 12:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pY1T4mB/1x/HK2e6EPQsvZx0ZxpL5KScVB8u3NbiQqk=; b=0jTQzsVUmTFwYNrfy6UksabvGF
	5OvWc3n90A/mqArikrp3ggK7yIEjqjnKbMsaywDXk+fnH8tbDgYWHOav9zWmpAkxXvVKFLq93kjr+
	hw0z8+wwbI/egmQQBP2H5B2OcJ6StptVNaLA27ftky8Z2BUY8s3ifWbBMRsLuNsNxIuVDZP4rSMoO
	vIbWCTyaL5FmeACteSPWbfFegkBXX5uTUNyCpm8EgwuEK+hFXsw18wx4wHHgYQ8Jwyer0TOEY+pbG
	cklLQRnFfyDt0tqmH+15cD6gaW8tM/xp048xm9bZKIT0u7uxi9Ylm2LQO9nqrnmLI4tIHPY29Jy82
	X5Lvm1/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXqn-0000000H2GG-2DCU;
	Tue, 30 Jun 2026 12:46:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXqk-0000000H2FQ-33IH
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 12:46:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n0DW1613515
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pY1T4mB/1x/HK2e6EPQsvZx0ZxpL5KScVB8u3NbiQqk=; b=UT9LN4wvBVpM64j3
	F2jAsfAILiZjYRi/KlD2eQ0MOKeqL67WC5X0+CrsUEriaIWFUiaGoLlo+n3Pwl9J
	uHDa0/8eFWFat/YWYLfcEJwEd5QF6bX9Z4OwXSJPbGg0GoMUjJkAUkQYMeCuapko
	T5OrkD9h97gJvlQSqmdsZWKCDQzeVfYFjItUkRfQjt7L4093O0XaIj8fw+CsdQzC
	6IzFQuULY5XFAu2s+/EvblbwfMuHoMlkrDqXKEflaNf/oL5S1uzyQqnYyoqrWkwx
	yTqAI/l1hiSsDIEpN5kwtUvgfTLuPIyzfTdhrgxG+nHg7+1/Cl2Pv2f0ACbtuBXG
	VvR2uQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cuwq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:46:01 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738be9df36fso137427137.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823561; x=1783428361; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pY1T4mB/1x/HK2e6EPQsvZx0ZxpL5KScVB8u3NbiQqk=;
        b=RIHSTpJwvwai7zpoRWpp2UAWYdntN4k55dAdvv8B3+LO2UFhYkaDIwM8+NGbLdZDV8
         3gJwy+s/8Und9E7RbZNz2Rt5hSqklqq4p4SRGZcsEsH+c/7/xumLRe2vs0YnrfQ19K2M
         L7DWST0i9uQtfUrZfsG7z1gUDROpFaf55zbN7v4BYTOsv1GRm9o+Hr8rvS1yLZelXVuw
         +i2m5XfdogK+qOQufl+3niYQuQg+N1FCQVrCddHD5nOEiUPQca4l6fvDXMGi+WZRAMsg
         DtYym/K5YWAq2PY7iTmy5QN424dSy/ze59u2empMoiW/iHZxJ7ywOm8jlV2DFDTTN4QF
         Kgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823561; x=1783428361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pY1T4mB/1x/HK2e6EPQsvZx0ZxpL5KScVB8u3NbiQqk=;
        b=C5nG785bS/oA42bG7XqnclsyHN1ajrAjxrUGyXZw4qtztXVHwKdtHsYY/eKKzyv6Xr
         /DkgOb9ZkLMdfgyNm9Q51Y3308btuwjv6kPiL48ZlxQLBY7uHNcNiJNuZritmJqdyrhU
         L811OuALTgSUfACAwmejpTJFdTOAkNh1Qp4V4andQq23ADx19uUSbOMXjPAjh6R20k6O
         FWc7d1C4VuDUImcYj5YY26a78F+CZ6jCc0xhz/mnuyAO/vxNHzeBeru4H37e4QKHShcY
         gpdI1f/P2pI6njhqNbVVNSifJH1V+NDYJCPMN2BqBt87PvZI1/Ibr0q95krnty7wzQTC
         fWLw==
X-Forwarded-Encrypted: i=1; AHgh+RrWvczZTNyr0vRFLNg8X9Bmu/pARs5ths84CkInpm+puNWewXGS09AabBtr4Ute/X+WjXCYLL8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxH8yQhsaOPRyyHpwF/63FSWJwB/xrjSHpcLmDPqohpVJNWxKrL
	nuHY+l4HSasydOd2V8I4R2bVrpw2nNIKZQ1NwIaikNaTeBtoZCreHn5KOqcSqikc1DCs2j4MXTL
	2GXEXX+qLnOEM5ViG9iKOd0QiEnWgEx4wpMn00DfSitH0QIvY0WhyXbzUooZaaNcF
X-Gm-Gg: AfdE7ckKkL0RkZigL2p0Aks9Tiib7k6XWuz4c4L4/2D4nJ7suNID+9b1QakEa3C38wV
	9rPjqbiLHrd5lJu6qlj8o7vwzS3bb2418I0p/SgmVS+ho0L7yb5I64+cJVX0SwhE8wnT9okFNH8
	0ylSH0YOepf3n0Jnon+a3lOrzBXyO1gnlWxOh76YL2LKupz3TA8Gg7FnCIy08dS0IHxZzezRxVs
	46JrpIZV9DHtecPCvWMDHtMzmg4RoHBaPJCc7iGlRgMyKlRJHP5kGbgCHPwaJvvvqoN1D7djfCu
	GvoWkPQyIMXEbTdbH/6xpG6IAp6Y7QItDilUAp0RNagClqdVMCoeCyJZHvqcnkDRT3mrlu0NYqk
	X8dkryVUiDMt+OPGT16ryoh3TRSzYG9eEXyE=
X-Received: by 2002:a05:6102:5802:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73a38839d2emr587858137.4.1782823560931;
        Tue, 30 Jun 2026 05:46:00 -0700 (PDT)
X-Received: by 2002:a05:6102:5802:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73a38839d2emr587855137.4.1782823560577;
        Tue, 30 Jun 2026 05:46:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c968400sm1131274a12.25.2026.06.30.05.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:45:59 -0700 (PDT)
Message-ID: <b14466a5-a064-4723-8ea0-98239cd50437@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:45:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/14] firmware: qcom_scm: Remove SCM PAS wrappers
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
 <20260626133440.692849-14-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-14-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfX1NiqxIpgvN4+
 0mHJGu6kPd4+MIEHFs8zO9HTCWSrgLnUF+6EXWhcsiG5e3gYTcxUFvKUEP8Xr+YrI8MDXq/FFcb
 NEWZHWqzAE+60wOuzgzsV+FQhNOIFfbUPew17GEJc4SojrYXed5yCaUuWFOFXTD5G6FPvH5erPu
 B+LmIBCwlLXRZDdYHrMPsNcekTEjhuktEkA1nwHCHd0Q7OzXoVMLWSNdt4RK4ggBX5lRYGzqrjO
 l7HDpR+bQVTYetUyHYo9NisRQc8Kup/zqe/1YeDBoowZJon3kT9yRMW1woqU2SJOP98Ab6MD5s7
 CEmp2gP1iqw2oK9mqMt87a9kVx7PyCPqSpucibfuFSr2zVUEQ4k5Vt6tNo02l0uG52ydkt4BSP1
 I06Nwy89VAdrAbpmJlAogGKX027eSyvVTZtIUbaZNohVgn3IvwDl5P2Jipf8QUOzE9nhF8FRN9U
 qKUNl3J4u3HfnlNkEmA==
X-Proofpoint-ORIG-GUID: n8w7cyFyqa-vAuUirn5RTJe_rtr5gitC
X-Proofpoint-GUID: n8w7cyFyqa-vAuUirn5RTJe_rtr5gitC
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43ba89 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=n1VOVlC_Xzu4QXtT9DgA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfXwLaylxBqtrTy
 nIp7Y6sUG0acxUHIK9l+oM96sCWZ4p+l9HH2tkWOtgNROyruMQ1rIQ/avctGrLpnJghmVUdyTV4
 fxn+vbZK5lyUfauJjd0QUAeYojrEvQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_054602_886547_4E8BB219 
X-CRM114-Status: UNSURE (   7.99  )
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
> Now since all the Qcom SCM client drivers have been migrated over to
> generic PAS TZ service, let's drop the exported SCM PAS wrappers.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


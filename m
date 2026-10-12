Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1488ECA9ED0
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ll0qihtjv0p7a6Ls/L2RxJXgO9wEDOARy2uDIpE3nF0=; b=zdAoBSRBK2a4BGEl4xjl7IOG20
	08zidHWDKOrU+3hxP83VAZQNpbdqavrW7/jiXalNVkDxw+4TC7nvdKOvLaXvWRtlnh8epqLbWSAus
	xfWHsqVt1GZUGp12RR7g/Xs4/3uVrwc0jpZd0ZHmJ1iSIylioj6ssFz+T1IwRl9ZAXDcWBFSdWBOH
	C4kLefqMBzkhbqCiQrbOITqml13Ny9DS1ncx+PjXl2JfdrGnpaqbZhEwMLuHLDQfbRV+h4C/Gf1WO
	Ycb1Eu3i9xQi2Eq67S+onHFpUoBNX2ehxr8kjS1VbGNFyZp4az7uEs7LmQP2PAltt/WmCC7YmTtpg
	qDl1Y0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBsF-0000000A0mJ-2m0Y;
	Mon, 12 Oct 2026 08:59:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBsD-0000000A0lK-197X
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 08:59:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8K7iA2796108
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 08:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ll0qihtjv0p7a6Ls/L2RxJXgO9wEDOARy2uDIpE3nF0=; b=Ri8kbeykUzzNe7wT
	ayRtyxjHpxjuLf66mqUnXMzGqDpa/rgp+TvSnjD+coQW1STKdXIsFe280Fsp/C/R
	/zQ7YFlnWh3Ma4mDZ98lRoSRSANynikZpqCpJ0inyUZnH89GU7EJbyRDvLHSFhKx
	Ghf9UbVg4p2H1V12c+EnY8NDXSPr9tN1urhShguKaSgj5dfyCIbccHO6uYHPoov3
	tCzgxSQPXhzf+CzJpyljYDGQOcPWFSb9oFaA2dqeThKVtC9VeY9vo5Y+/skZq4V2
	rxg6svBO3VrAQd0e7N23xfnAz7wxXiEVen1iseHyb4uhu7LZ546Jde/PJ0veoCPD
	vxmIXA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3ga0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 08:59:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359d11365bfso3162668eec.1
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 01:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791795548; x=1792400348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ll0qihtjv0p7a6Ls/L2RxJXgO9wEDOARy2uDIpE3nF0=;
        b=gAjkjd+dfAq0rGtIegQE5BWS5MdSCvizJaZRpvuUjLxQ0I3WlSO2gUy049d54bOjRJ
         dOURry62eqsS6mrEHme9Bsjsz5mWNqzXdhiZjoppV96z627TxADjFIv4ip7lYYTQ5DKu
         4HXeRpA8TspYrQ04rgO1FzBAi22AtdkMQK+qdbxEImETI7KY/+eFDvk+IIt33ScrMaxe
         6fK5bV6qETYge3KRQsPM8cYByOUCAHZ3YUTZMdNO5dPI7v6sKhYcN7OJQKChx2hzJmuN
         /stfff/35JcqkssribmmMPg1m3koMhw0iS9NgRR0wDAAlaEXoGfv8vxPf/ucfTgA24c3
         wRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795548; x=1792400348;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll0qihtjv0p7a6Ls/L2RxJXgO9wEDOARy2uDIpE3nF0=;
        b=e6nil7sWN8NzITSTS9DIKOjsXcmloMyy7y19E474+rL0Dq6dVeJ6mDr7h6ZvzaQ2Rb
         tWUtUHCwg5mKkBYes8cZx0nf8Fb3yuYWQ/slxi3kGh452U0OI5+rCVN2x5GVTD7n35l0
         TxwZZoAbYfVKPjnCPBs6f+tSDS/X5taEolK6tm5j1A0yo5Eb4TLIiqaRzjC4idyl/Z2S
         HYoVMT+mWJIUvgMiAuVxMwC2kdqgHIjAUc1u7S5/hOdK9G86TadDtbkOLh6HHakWic5P
         zYB81l2eowIelqnbETl/DRKUJvX5pbCOwAafFIDwnkj5cCDUxtRKP9wmdmBpYnBg7C4e
         5w0A==
X-Forwarded-Encrypted: i=1; AKwUvBzf/QmWjzygTGqbm0lsr0cJMh0FcqG4o3cafuvKh15p5sqW+UYqmRMTnc3dWIvKax8SH/NlLBQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYLh9qraHJdHcV7wy5r1Q14xksvQtVZQ1RJZLyJEix2sUEXDpMgI
	uVTxOJtVKIzQCagDkFW81QqVc8+NMUPTEXP8lr/DxzfF3PdXsk1IKPS+PNfDQfvNzB7fa3h2J+y
	Jw9zTt5lqyQ1hGsBUSwaLkP31q8p9LwxBKmpUpdaO8aBBiFB2d4sySB0nc1mijzeX
X-Gm-Gg: AYBFou3IV+ovy23PJYGatIYk9dfi8Nsr4QdDTcFrYUzljygFtD4rm8tk2Ame0+l0Gml
	vMVSGh1bUOyzXa/t5gIpUAecJiP4vsxbU5hTYqYJjgOgagP7ZSj7kuCsjOsnJGBlrcjl1x4keaI
	nywPQB5eEjHiO2Yxa3gAZAZ4CL8pImBtji+d25W6scYclFnmW9gfWT1gTc2FyXwRK5rH8Foxqqa
	Y19PLc87M+wGk8ZTxQ/iMu6C0BvPUr1jDAhMcXl73czvqn/ioZlkGW9QjHI+Ee08TG2SH5vuVkV
	grhOWFQ/uYjDbiOcPLWsEcqNNem13PqexPMENmCPthkzJ2to/ePIC04zbotbT5MFBpGqIhAkdrq
	GfbaxzhIUSaCWrC74aoZPEyUkTdKpXZj9bO21DZmX
X-Received: by 2002:a05:693c:6390:20b0:35a:6a7d:a0f8 with SMTP id 5a478bee46e88-35a6a7da650mr3600150eec.7.1791795547958;
        Mon, 12 Oct 2026 01:59:07 -0700 (PDT)
X-Received: by 2002:a05:693c:6390:20b0:35a:6a7d:a0f8 with SMTP id 5a478bee46e88-35a6a7da650mr3600133eec.7.1791795547386;
        Mon, 12 Oct 2026 01:59:07 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b19c6c7b4sm4978814eec.24.2026.10.12.01.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:59:07 -0700 (PDT)
Message-ID: <2e594004-fea0-4814-814d-6a716de018a9@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:29:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Fix NAPI resource leaks in AHB
 external IRQ paths
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNSBTYWx0ZWRfX4TcQG8a8hPto
 wDTai6fn805DCntd2PgkES/9+OsuW++qWmytmZiH30qcpoyxclAOUnnHABQ9/BsuvG10E4cIRGy
 PZw0tFujV+kiryPshE/H1P8jTmtxVnWo1qudtRaXdJ1/+dNw8O1h0jr6X2NJ/IcX0iXqfQg1cvj
 FEdfpsSDFeWoRBcDyFuLT8Jf07XVRDDT4i0DMfyMSU0k+eCs/dadqeNyrCXiPdWiNkzo4RAHBmg
 KS4Bgsr2r2TbKpboQsQx7rD9pzLVsYDEGrbEbAYkCpiH+ssUta64NesKFCcTp+DHEFwT16x0cbJ
 +FkzPDqFoUAG5mO2NRUsJk/ttNECerzWijkmxrVim0L8UxdRvodgBHRysTWBLDdhS/4sXxUU5mo
 M5sSrgMlJvoXXKhy9yGKz7+CH9MD54PrqB4/q0HHk1sdfM/7P+fW+2FFku6RnvHRT4xxoP6eVyY
 hrdvlu09qLnc1fYY2Ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNSBTYWx0ZWRfX465eWG3O6DMH
 FPx5BV/aTwI6U9W5sAxI7RZZFlxpBpcT+/KGxa0GfyW/9Kl7R4w/qDAIe2TdW876uh6O8FHfxhF
 xm7QsrSZIBK2Lpye4AHJQamPo3feGNo=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acca15c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3Kn9n7x3DtEw6PE7aXgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 2eQXn3AcVqze5iYNFDeKWmfBxnkQoTml
X-Proofpoint-GUID: 2eQXn3AcVqze5iYNFDeKWmfBxnkQoTml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_015909_319355_F396C005 
X-CRM114-Status: UNSURE (   9.79  )
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

On 10/1/2026 10:24 AM, Aaradhana Sahu wrote:
> Currently, NAPI instances and their associated netdevs allocated for AHB
> external IRQ groups are not released when external IRQ configuration
> fails. They are also not freed when arch_init() fails after
> ath12k_ahb_config_irq() succeeds during probe, or when the driver is
> unloaded.
> 
> Fix this by adding a common cleanup helper to release the NAPI instances
> and associated netdevs. Call it from the external IRQ configuration error
> path, probe error path, and driver cleanup path.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
> Fixes: 614c23e24ee8 ("wifi: ath12k: Support arch-specific DP device allocation")
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


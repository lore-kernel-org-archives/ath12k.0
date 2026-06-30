Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247ACC43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 12:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqgiAyPpNCB0A0IntH53l4iOkxkfpMU8dkDpi4Z9XyI=; b=xj5tyI4Jy72hlna8D3WUSvVSzr
	Ff8ukSrkwU76746Oiwpdn8/cp9tJ3NKs9on60Gc/UbclWmJEz/n492JqOEyvzy7wvc0KADaczNiJt
	XoipVSD0apqx4+3Rygy9Pr/Oi1aKBrBfV7HdkEY9WOLUN7LULpF+RQr2UUvalSSXNGIp0nBOObH76
	4JcihDd1aeU1uBJ7QOfWuD+pC0VFiUderR/lS8SdAjQkbXoXvnl3BDNxMBEdBwe/uJTaNDu9HHESZ
	zJhkYCmOXuOYZjqybMG9cWnBlsuy04fbEJS7etBwRTJE725uG9cOA6xMdnj+33cWPcuVyO/XxyDeH
	7gGhJo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXnR-0000000H1Mj-3kEr;
	Tue, 30 Jun 2026 12:42:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXnO-0000000H1LN-19xj
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 12:42:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nC0x1606367
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vqgiAyPpNCB0A0IntH53l4iOkxkfpMU8dkDpi4Z9XyI=; b=FDALlAFDR7huBxwd
	WpIQ6SpAtlJNosB/BjBaKCGSCxBr9UYGDgxAea5BPhA/iJxfpFmvJ7NPOpawWx90
	pSel/yL0Hy9QAJ85bUk+hw0x7kvr04y2alpgbaiqNd3LoZygWGn3rcAfEMyWuuQS
	AaPFT6C5b+WfoAzB2ITk9au9cNNvVTfsSpFdP+zhh9thg3RcFEqDJlKYgwufpqxO
	+44/GUDjNzNBntgDtsGCCSZe53+bCRnzDu2qDe+sLpFixkaqrd1yKCNbNQyysm/V
	Rtn5XnXLAFjqIECmh2rqZt1brTWzVH5CiDI1CUZi9idMKEpcEz8dvnZfx8DK6af4
	7fbMVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5tcjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:42:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so1153471cf.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823353; x=1783428153; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vqgiAyPpNCB0A0IntH53l4iOkxkfpMU8dkDpi4Z9XyI=;
        b=Hea0Gj3XxlyLu5rQ72xrlRsIkGOotx+Y1aRYbCTNkphi5nflKZKMMoxjfc7lWasPQ+
         lutLnATl6kcuxOrUivKYUNcqtUK/sn0vuIdZWk1Id688HkVR8N6jRzQUtUop++diBQjo
         /+crNUsU+gNjTd4/0a2zCE5mUQ64YJ+O9Qdjo0xOuv4zz6FuZ0BC2R0vzbek80HfyJ2s
         Xc1o2tiM5Q5myqDJ0QKCtZ4WAqt6v08PsHpuunNZLdd+rs3eSysvShf2HSn3a9jkjBO8
         ZSBQl9koE4oB07F/bi3hxAQ9g/U1nn9c6WSEl4Alz4X4aQoGCkLn1/Zu2FlgX8N8xvFV
         S8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823353; x=1783428153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vqgiAyPpNCB0A0IntH53l4iOkxkfpMU8dkDpi4Z9XyI=;
        b=JUOYFFcTCm5f0nK8OPZGG6AssHvjPs7FRsHi1dQDSrOYwteHUdPdPdCssyLtBOg1eb
         Nq+2yvr45SZ7Vdb0TIF72W39cMC9zD0GWPkg/zV9IMXyjqWlJzszaS9PtIYa9w3UvitJ
         TfHCN9tBKWwiv/I7sZvUZSXd2WmkCmS8fOr6XQQ7s6TRYoeY+GkxtSstPlBzSZrXzJEF
         H7gPEFgSrUo/alsxYagvA0kyYPcz63X9qw0h9Szmv2Zt18thBJSXwDIg23lokRMKW7PX
         p8owl5BiWzpSH+Ygma9tpOhuk0vY+anRC99Xn7jg5LTKQ/14UN9eHsgL0sxFlPPh3z6T
         7nAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+L15aFZxKMWDXK8lIrPbE3XNHSmrBaHIyCioBJ0IR5XsgnWOwiDqiVPAShRi09pQyju3/vCjw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz17vfefECBp/iz2EfYUCykBSWo0OBcYhMzQ4L9zvdWMa014xqE
	GtMwJah3MKUBjKNgduQwACWGRgVKe7LVsFE098ZANQTxSZuaFMpmS9ydp9jpGW4ylAQKlECBZPK
	JebELz86r8ALNZuZ6QxgXB7y2p3UDIzuFUwrJjbfyhL75ymrdeMFUottBLYbt4zXd
X-Gm-Gg: AfdE7clDeNNOLibKzI5KfvYZQPEVTvXb2y2eVYboFJvzUR9xm1eo1rweXcEDx1slWzA
	3CeTsXKp/zelNug+EyUgNuJ5eBy6Je+ytWWaMI6524QckClboo7Bfl1uTvZXuYilvzoWZrnl9qd
	8Jq2bvaFfj6oAc9XTFEItL5QlbwdcGMGDgpfZPk8XvxCcrQUSwopDkM6TszLed03Od6/H1yiGSC
	lHRUSp0hrURiiUlFoJceATrQm9x/qbksRQJcqlgtYmgvN6JbLDW6CoH5QLDPeYoP/gdgk+5X1jm
	k00qir3GVU2XVMDR7V9BBFgC2ytIePzlPct2mPl9jFssUGMGGMLJUtIM4hSt0ikNrlnnhe9U/fH
	vqsSc5SAmbcjMXtKqFoN7MOxWv+tzW6ldgic=
X-Received: by 2002:ac8:7fc9:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51c10754ef1mr27550251cf.4.1782823352479;
        Tue, 30 Jun 2026 05:42:32 -0700 (PDT)
X-Received: by 2002:ac8:7fc9:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51c10754ef1mr27549891cf.4.1782823351774;
        Tue, 30 Jun 2026 05:42:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c19esm118502566b.51.2026.06.30.05.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:42:30 -0700 (PDT)
Message-ID: <c251430d-2184-4ecc-8d05-9cb47533e5ec@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/14] media: qcom: Pass proper PAS ID to
 set_remote_state API
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
 <20260626133440.692849-11-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-11-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a43b9b9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XI7qjyBPQyksM17I1wMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Ej7zo832jE3LbgnQTHkQ7Ux6Qt8D7G8Y
X-Proofpoint-ORIG-GUID: Ej7zo832jE3LbgnQTHkQ7Ux6Qt8D7G8Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfXyGz/raRqVK56
 HxKoYMXwu6QCYH5i6h3z+Mq87IpgiA5uVtkWQMRlLBSnTLatXPEWWxEfOFO71sjgB0+ziinY9kg
 WZJRcsNS4PeEM8/L/kp34Mgb9i8MDzU68zUvRL9e/oLnYiARmPAJHdKEaqL5ezJZ/Tzv/f2JZ8v
 n/LtddqGciMiJvrrkBA6OaRhxIMYforFDN83QFiLxxfZ9hThN8lB/abYYuW6DCejpKeUATA+X13
 20Xv+spn+qiqOajZRhcdwWaUv2k6Afa/Rp+QkAMRp1zxWVW08Fiw4NBw8pXbSMSixjsp5b2nANk
 ooZ1HSiajurLYU9mnNK8+pn71qs0BFI/etdG3WXIq9doiU4IOwzZp58Q39tD9c94YbPCfQJyPID
 kxMTqNv6KmkABJOesGf/yk/dhvIHg9/1jHCmJCGpsqIFybfctCkO1JBxF/MRTvYZvtT5ewYH4UI
 cKSvkdd4UmxAToMy0Ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX8Mz4lZo4a2oX
 7b+HteV4OHiGttPS9gdU3S9dUELbHpGsBLQYQYGLi2S2//a6a+OgxDh1Bm1pHZ1AiPbikyf2SMn
 wrl4Xm+wlpDHh8HTj6sZjUH3VP4OuDc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_054234_483773_017A4EA4 
X-CRM114-Status: GOOD (  18.22  )
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
> As per testing the SCM backend just ignores it while OP-TEE makes
> use of it to for proper book keeping purpose.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>  drivers/media/platform/qcom/venus/firmware.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index ea9654dd679e..d2e7ba4f37e3 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -110,5 +110,5 @@ int iris_fw_unload(struct iris_core *core)
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_pas_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
>  }
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 3a38ff985822..3c0727ea137d 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -59,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	int ret;
>  
>  	if (core->use_tz) {
> -		ret = qcom_pas_set_remote_state(resume, 0);
> +		ret = qcom_pas_set_remote_state(resume, VENUS_PAS_ID);

This should not be in the middle of a mildly related series..
The PAS IDs should be centralized into a single header. And the
name of the driver shouldn't be part of the define. I would guesstimate
that on the secure side it's probably called VPU or VIDEO

Konrad


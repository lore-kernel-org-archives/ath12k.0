Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6372BCD3423
	for <ath12k@archiver.kernel.org>; Mon,  4 May 2026 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xacEJq2Zps3FgavLd4lLbebjwrUmMkWW1Dnv6tEkWBA=; b=U7WgwxVcDNtwwojeGnaBsQ9cNQ
	l6UNO6qvPDfdT8ycaeLTz8IJFdq3JB7csct1dZGhZ9RQ41JE97XL7A+TrAr4hL2Wl3ELdWDiQiOY1
	3CONRcd/qjbtTryScClAHZ5DEpukudkHpeKjfJSMd07ovJIMeXmVXkTWOXLaWnrSXl0epQnYRTJfo
	LeHEsqgQKD6Zz8rTUJGb4kqn/MZoL6A+v5stTVk7MqYlcIRKZ7a1Psp4YqGM1WpAHMBVmQfnlCmvy
	i+QSvKL7tQmxhI91QXduL6Mp4oodcrBhtZaUEunyF+azBZENGUvrTE43bY+G19+PXZMVeSj9Sn8Jw
	wabYmtaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJpTb-0000000CoCw-3rf0;
	Mon, 04 May 2026 09:20:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJpTY-0000000CoBw-2jIR
	for ath12k@lists.infradead.org;
	Mon, 04 May 2026 09:20:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fMLT327030
	for <ath12k@lists.infradead.org>; Mon, 4 May 2026 09:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xacEJq2Zps3FgavLd4lLbebjwrUmMkWW1Dnv6tEkWBA=; b=DP0rHUCcKYKrOTU6
	4+YLLRO47dTK0k95xf1aJjr/zEC1BeU1ZmwbVwTfk2Ye9TPn12j56h1pFtCLQAC4
	KhYDjPtN01UugvozyOjlVSyzEjIoYB66OLruaOmkbrdsR/a9Vhg6Hi2FJsXBmucu
	yDxrMsQbSShgrYKrMJJeQ4yyShtgpm3+qErJTb2VGDsfat2kLJkr6Z+Z4OUiUPN2
	vqKlDgQNzX0Elz9mtysDKTIQ37s/uUxNiXnIutHnNZxaKu5x8xAVTDGN4r3tpeb0
	QZqvOgpCO2l4LK6eoDpj4XlHxYa3zhG6bviZdFoj+kWClXiGFA/uAZT9PvhmihHE
	XA/PQw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9n8d01v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 May 2026 09:20:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f9429f49cso4927508b3a.3
        for <ath12k@lists.infradead.org>; Mon, 04 May 2026 02:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777886425; x=1778491225; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xacEJq2Zps3FgavLd4lLbebjwrUmMkWW1Dnv6tEkWBA=;
        b=gC4mG5nFya/TZC9JXzP5tc95BF5g4EuD46qHjhxm7IqSHbCgNe0JLsyEjtpXegv823
         zaH3tN1DTunK1Na0lXPOIC2SuY8cznAkaCMsSp2VFMhX9V77Re5GBcDvVIDfP6AKpaWI
         FF4Yal7lMeC1G/VwEfPWuoRaIscK0Vdb1v5wBvTwUTBy5l55KRo90DUSVPMLUCuIIAhL
         qTseydoi+TGEgZ3NwZhIAOvXux3USGDh18USew2quu/4FmCTNpFcpUozS942z+1CYpQe
         OVjc6SXBz92W55lCz6EEeu4s+054amsQGL1aXE1H4JpMA+BoOYcZq7UQkb6pnVEcj2L2
         Yd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886425; x=1778491225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xacEJq2Zps3FgavLd4lLbebjwrUmMkWW1Dnv6tEkWBA=;
        b=KiRcpIxzP8QIZ4Nty68xt1ReolV9ohtzoWxIw7U7GE/PYCky1Ym+5Gu4DE9OKvJxnE
         c5IBWYr2cSAldMPHa9fIXeWmkTDxOctaqgUAGGySi/QPT6hlFTlEsbq18pVw+fds2iPn
         RQWY1JCcbj4dFxwPG3JY1nCuRno0mmF1ffmD1ikZlv1t9yXdwG3n9uuhTU1uH1MzfpH1
         5pZgg5ml99cQIRs71tqn/srYE7glnFsR2NohJlaDY37T50g8yOuu6gKT8Ifjxa3tddEz
         wb1lSWCsq2ragNyi9ucgIApYILlEdy7lHmAN3qHAKVCd4ax9s/CvHgkCNer5tkv5qgE+
         0uFA==
X-Forwarded-Encrypted: i=1; AFNElJ/xHfh+7QcI94oFkqksIU/n+R2UBpNywI/fhp0LbnfapGbCzZ1bNj8dflkof2E/F+EijgEjjCE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9b+CIr1Ufq7Cy6TW0iXMnte4pfqeARVW8z+kxGUF8Rh46MiKU
	mv6cAbkbKw3XKJ6fEbCp/EEO5zwIFmgI70P7vlYc5m+jKpZe7aLyiX6FoW0Dg2H1ao6szNIu8wX
	iDPGu0lH3JouhR4lmuQkuZMLtVqtx53OskfhbPs2IrL6CkODZnzR+mjhxJSjg1AkU
X-Gm-Gg: AeBDievJafeEJdiUDMCBRrovgneykvbXklBZiamFWAzi5+QLk8dIOfT1xcZfLrYlIt5
	LI6YhURJtGxARa5i6RfOzXYOoLjlkwivMEc4ENvjIHqNUsWkLzh6hGICzlL5dmAgyYObl/8PnJW
	BOTYjjvu8K3V3LyCfJLH3oC2cYJMDAzfJWk4gVAKOs2ihTEOVg/v6dy1+hW07NraWBqyFlVaZNI
	heK8ZQpP80wmzRL52JOdxdyOAWdrYaD2Z9juuHNPdC2ND75vGes60smSGpvlvIaYzihzfvPMOHv
	zFNr4A/FeyPqO1GNse3ZD6ngoSqZIcQpiF8kQCUbSAsYYOZGSJ3ldHmQ2NIIc2F6xHOIGOAqM2W
	uZIvYFPIsW/+QKBb9Jfx+TWuIU+RyjG5do7ZElURdfyl59oEscpuIV3IhteSiSw==
X-Received: by 2002:aa7:9f07:0:b0:835:388c:9764 with SMTP id d2e1a72fcca58-835388ca073mr4931587b3a.37.1777886425002;
        Mon, 04 May 2026 02:20:25 -0700 (PDT)
X-Received: by 2002:aa7:9f07:0:b0:835:388c:9764 with SMTP id d2e1a72fcca58-835388ca073mr4931557b3a.37.1777886424440;
        Mon, 04 May 2026 02:20:24 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0049sm12316337b3a.33.2026.05.04.02.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:20:24 -0700 (PDT)
Message-ID: <81d83991-df25-4fc4-8261-6793ea9dc438@oss.qualcomm.com>
Date: Mon, 4 May 2026 14:50:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, op-tee@lists.trustedfirmware.org,
        apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-3-sumit.garg@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260427095603.1157963-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bPAjGIBP3uQwSdoMUUTw6PMo-gOoNqlY
X-Proofpoint-ORIG-GUID: bPAjGIBP3uQwSdoMUUTw6PMo-gOoNqlY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA5OSBTYWx0ZWRfX76Od/IP5Bc85
 VouXa22uNw+0RS+lGyPVa2Ujgpiw5ZMCSo9s7h6mG8l/M3z1IAXDt4PDyGIUqn3ROGDIAU5wZ9/
 ULhkZlN5HZDPooTijPdOJaBpZ6HZuK1UoSNrdfKcEBCgg0ihLQI4fIoCqKgW2gTk3kBWz73LW2M
 PBMG6nZ8ExzbOpHbTqSSjN5AyIWiNjv6sIh9Nu3bL5hfWdsba6iensQTcSXR7riLZn1f5+6bI2m
 EBIKTNv0HlCkbmO86l+APYLbWKCAl4UdW6NxHydjBwv0M75ezNvjEw4AK38sBdx3YpkZm9bNisD
 ZhGt63z0mMQ0Lnk1D5GhZmopRgCVJHrI7fRzJthvSqh7dlkauq1dPvSuW+OAM3h3giAe09YsBs/
 qUj7vZZZWZkP6jTLBM4fiINxSIBoNFKtGE9gbP5+351pPL2WTVxk36PuchDl2txi4hbbAL7oP+g
 7rT/VA1owK1GvYZXn3A==
X-Authority-Analysis: v=2.4 cv=ScjHsPRu c=1 sm=1 tr=0 ts=69f864da cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DWWpLck2SfFL7czMIZ0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_022028_817081_E4D4A39D 
X-CRM114-Status: GOOD (  15.37  )
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



On 4/27/2026 3:25 PM, Sumit Garg via OP-TEE wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> support these non-standard SCM calls. And even for newer architectures
> using S-EL2 with Hafnium support, QTEE won't be able to support SCM
> calls either with FF-A requirements coming in. And with both OP-TEE
> and QTEE drivers well integrated in the TEE subsystem, it makes further
> sense to reuse the TEE bus client drivers infrastructure.
> 
> The added benefit of TEE bus infrastructure is that there is support
> for discoverable/enumerable services. With that client drivers don't
> have to manually invoke a special SCM call to know the service status.
> 
> So enable the generic Peripheral Authentication Service (PAS) provided
> by the firmware. It acts as the common layer with different TZ
> backends plugged in whether it's an SCM implementation or a proper
> TEE bus based PAS service implementation.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal



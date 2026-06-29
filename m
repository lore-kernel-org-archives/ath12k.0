Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7048AC43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 05:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pS8cvZxJAhKc4BMxA+98qFjlhTjbrIv3l5VR4CZyZp0=; b=ZX5xq0Gtv6svJbgyDiUvCB2gnP
	11xGXTLP2H1HyoGi4t9LPW2spQ6iARAODnogFLgJPY57tV8iRvFddAv6TeWiUbeFWCpLwm7dFAd68
	6S5e+F71BRCCEz/iJOsquYochqUbD/652LXM+zzmfO5AMYEFlYAB6k3IKdEx3wezKTkVDMnWgBjQd
	vSvCOpnVgbl0ZsrQEDYnAxowoK8BkUOK6BxmoWFD6WtQfH245tO+zdhG/BUrO/H1JmwmVdePN5qAe
	Pz1xEb54QnXn2XhNzFlv2rqC1QW1XSVZjZfdIrpdPJOmAXFBMlloXB7e/XrOvB4lveAi+hIACZGhk
	ZAju01SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we4lE-0000000Dikb-0qaD;
	Mon, 29 Jun 2026 05:42:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we4l9-0000000Dijx-3gUq
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 05:42:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NIqK1754418
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 05:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pS8cvZxJAhKc4BMxA+98qFjlhTjbrIv3l5VR4CZyZp0=; b=WKy24ugkTSh48SGJ
	1zZpM2bCXfA5NqsU5z/07z8KtIZ2cBpUyFz/Vny21f6lMTxnQG7MH2ZBVl2BGaUa
	9CXC4KcdPeSKQXKFIboudBpsSiFSwPsQYl7qXFj6OWnh4rO/I4mmf6f1c0a7Jqt3
	A1nZYFcxNQWwq/QkOs7ZT1G5NdTNkmIXfktateWpUbG96zVSE65y+tNXx712DKEj
	2El3oSQUNkh35hLrfMRjUSMIWxMLK9r2+B5/l/AjBZdoWvzjwsm8AizvNBQkmCTc
	JidefiISKqlyL5bHVMJF2klsGPF57ePNBoReaxGCv+aVC4Gf1FIDI3YjUsxizp21
	prGlYA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27334r4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 05:42:18 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso4599237c88.0
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 22:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782711738; x=1783316538; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pS8cvZxJAhKc4BMxA+98qFjlhTjbrIv3l5VR4CZyZp0=;
        b=XREXzMAouxdCGl6x6VdjEm1ylS7NZCG3gHdS7RV0SuZjS7ggr3WYQyGEr5ccuDl6ZL
         QSx0AtueznJ1JfguxheXpvbYEeg55FHyEu4qYnc+RdtcjVRIbitqIZydliLUBOKZqBTY
         /TuwFlyzitwoSFvGDfZJv37CCYGKfrTubfhXLipZt7M1qyGc8vlfcgOUdQk3S4hX/vLE
         416FKeT8eyfSWINvui3jm9bUVK6aDdhzNiWfYz29ClCp4yZkP9fiSxo23MQ8J/FZWcKH
         JFqS+2k0B7EOWSk/9lHwTn7IkI9ajbVj+8a4UDslj6YVXM3hqisDmmv9qazSiFf9MHea
         GuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711738; x=1783316538;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pS8cvZxJAhKc4BMxA+98qFjlhTjbrIv3l5VR4CZyZp0=;
        b=gToKW6IjzgcVVijDjf8ql4EDNMAsJ5fV8WYXryDHZRHyT0lk8+rIoXHxgsorfi3nSo
         9Kh+a7T3aQ0fir3SjwF9gDp+Q7sxeLJ+z6Y27evHdVfUU99fixTbvvr9+RUDo5o+02zu
         MLP8mZRqgmrNXBHAFcOlWqxlunNBDetHXdUGVRGpyU+0v8zAbrZ31aRF9JzVvJgHbNL1
         KNvwCoDWFfRT9gPMEu+0y85kgU0b5kGgqaNkYokq55obr+fmjDfv+h2iD3B34RQu7NKc
         fiLvuhbuW2j0zf6a59yqQJo5yBhi5A4Z3jckwkQ0Ut4AIOs6YFJD3XILg2+xmEn0KX37
         wpQA==
X-Forwarded-Encrypted: i=1; AFNElJ9pBqBJCuVJkkGg7Khi/Y7BjdejdZe2dsJA2kQhtNOwqbRRwoMJ5fFk0ZBHp9NfwJAnTnV2wOc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzigLbmm9vDVqthBK7iyX7ygiXmp7DFUZFUq10FwFZpTZLeA913
	aG3gb5/FVBbY4TQZo4Bcxwq4SLYVaphH+WN/xrkx566FfQEhzehKzfdZN0QgkhbLeESBqJPsICN
	CEjSkrt6CuWaZMA+xs5haakrTc9X1bKAgtJb9tdK0zyTCYUgzXDSv4x6ZLbBR1VpO
X-Gm-Gg: AfdE7clx8vq9Z9ZLnUujhFIKMb8IlsnRj+xZsi68QIM0fvOEwZy/SAncD+nDHm0hfjH
	Wl98jY4wiYVx/K0SF/gYj3cI4RddAOZvQwuX+x3QatI08PGQEV6PKHRFdJbIg5aFIMbJtHELDbp
	5eLuc1o8JW5CWApdCxTrrmd6UpZiivPfA608fzaLXzH9ZZjYxUx8zLEJkraDY2uT8rFu+N5jAbO
	YEV4sdImMsX8tm0/5FvsJi9VshdvifDVGjD4f0+BM59hiccBUZmUfrEm4i/ppij9zAnYKWH20k9
	Ph9qc9tXxkPa56kf5xCv1XV8gv1JReNFgImwhHTtUdwUSSJjJQZanp9AUdINngohQE7myM8J+UC
	ZZQt0WK8vrAuZHw8/r10OOrxqPF2sB43x5tsiZT6GAsA13gXi2ac=
X-Received: by 2002:a05:7022:410:b0:133:3bb1:8d40 with SMTP id a92af1059eb24-139dba6db68mr11548589c88.15.1782711737836;
        Sun, 28 Jun 2026 22:42:17 -0700 (PDT)
X-Received: by 2002:a05:7022:410:b0:133:3bb1:8d40 with SMTP id a92af1059eb24-139dba6db68mr11548572c88.15.1782711737298;
        Sun, 28 Jun 2026 22:42:17 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139f5901f73sm12123581c88.4.2026.06.28.22.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:42:16 -0700 (PDT)
Message-ID: <a5bd56d0-ea90-446a-b94d-26046df32586@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: add QMI capability negotiation
 for dynamic memory mode
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260626084327.2022076-1-aaradhana.sahu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260626084327.2022076-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a4205ba cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vXOABIWjEGlRoqXTTScA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: xEJNZZHi-ezIt7xuyQByPhwvAmVwD65R
X-Proofpoint-ORIG-GUID: xEJNZZHi-ezIt7xuyQByPhwvAmVwD65R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NiBTYWx0ZWRfXzOo3eXnnuWVZ
 nXgKSsjH5yCv9kxx+fnEiq6HX2bOM0DJNP1kd/rVAJT6AAlntR6juegwf2OhVkKkgSbdx3LBTDt
 vH6cwzsZGNdZaFzAAjLalAZcTKbhC1qPZP7hvtjm/02o/WmSC3K+D5RLf2ObU94yk52nXw4WXIn
 F6bHGbymufIofNIKtAyFir7KzQ6Cj+RYKr3/KcdQjedHsgx0HdApQ4LuojgWL3Pr8YL6O8P4RMq
 1hJ9+dAl9yOcpLDz/kh3PUVJ1zAfrGbWp+pvkfZXHSQ4Yp5DsYp0dp9OwhV0HFE5oafmItw2VfU
 zHovXVucy9dGlqGPccZp+37myoS6lCMiZ5KOkinAlV+dt9Q+Bw7pm2ahtO1kUzrRveh53mNMEgf
 7Ncpte06kZygdSpXgydx1IB4YUY3qTJg4mMFESMwNsYZ2iAtrnrDZ3CFDLYDAGnPRmGNNHHKnTG
 dvSx8mf8t7ibX/qdnnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NiBTYWx0ZWRfX0PirhoTaMpg1
 jryA36uMSdvxxCUvXv+6jpTawTZRnM42SmGYCE6DfpNSi21JC+g3oAXnHI5OLpGLR1R5JBHo1mS
 wh7SrW1/zt94jzozlmSKZ09YJyR8qAg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_224220_053695_6B490D61 
X-CRM114-Status: GOOD (  13.21  )
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

On 6/26/2026 2:13 PM, Aaradhana Sahu wrote:
> On AHB platforms, firmware operates in two modes: fixed-memory mode where
> firmware uses hardcoded addresses for memory regions such as BDF and does
> not request HOST_DDR memory from the host, and dynamic-memory mode where
> firmware expects the host to provide memory addresses including HOST_DDR
> after the Q6 read-only region and relies on host allocation for all memory
> types.
> 
> Introduce QMI capability negotiation to support both modes. Add a new QMI
> PHY capability flag dynamic_ddr_support which is advertised by firmware to
> indicate it supports dynamic memory mode. When the host detects this
> capability, set the dynamic_mem_support flag in the host capability message
> to signal the host is ready to provide dynamic memory allocation. This
> triggers firmware to send the HOST_DDR memory request and use the
> host-provided address.
> 
> For backward compatibility, if firmware doesn't advertise
> dynamic_ddr_support, the firmware continues to operate in fixed-memory mode
> where firmware uses predefined addresses.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B59DC43458
	for <ath12k@archiver.kernel.org>; Thu,  2 Jul 2026 09:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezVVq2U50VUNDTO74pfMslMnYi0egB4QQ7ic+2Doqcw=; b=cOih6Fer/I8XqI9RCHvjlYYfDS
	7E6NF1XAyhr+YlkvqfRTyzjKciKeuDxfnIo+AVXEwxzT1k7TxV6zTt1mZrMKfICOH0WQQ//ftgXhV
	57K/w+NBUPVrclkbLQF0SndxEbtd8cTXZq8Uoh7GpNVa4SWYAgSxv3PDNvSE2Gm8eMl8gRYia9TxJ
	vMJGvS/Tn3ubIm4p6XQDxbpebCx/NkdtEt9dVS77d2hbnVH+/4Zx7pZnUWH/0qf43Kmj8f3o8aP6C
	lCBV9gWhkuj/4WFKbIb/+fuApTLOVlwehA3eBlyBKWUREkYvzKa18U0HZM3BBt+efft8mGrk6hynk
	r849rD3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDmj-000000041ki-0jiZ;
	Thu, 02 Jul 2026 09:32:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDmh-000000041ji-3ybt
	for ath12k@bombadil.infradead.org;
	Thu, 02 Jul 2026 09:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ezVVq2U50VUNDTO74pfMslMnYi0egB4QQ7ic+2Doqcw=; b=pGSeGwaP2r8koNgMlA5sYWqOAw
	DpHnM0UZXFQKVXJ/9u90Wl8CiNXw3PXqjdl0bnnlIvaU/5eBzLCruSNvR+5c1kFytQSOHsGxnNvXQ
	GxbRWW1qz5AAV8U8oC5Bn+8Mq/c2PLbzIIS6VYJ9C/66F/f9EARJpVOvh0rvPxpiVihh9ijQMbpF0
	sWF1M5U0bqQctg7XsUMmC8NHhvWJnCA4a1Mhk0GdLDTFL29kihxE5YFVKHpaWn1yVSgU9r8xPcSiS
	rwnbLn1nOo14hiTtG5RuUFYSWJB+bE+OIQP0yFSv300sSopUBs2d/Xnwbw1O2Qove8NrPaBG1+C80
	Il3fHkyQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfDmd-00000003cGF-3x3v
	for ath12k@lists.infradead.org;
	Thu, 02 Jul 2026 09:32:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624m14o3486463
	for <ath12k@lists.infradead.org>; Thu, 2 Jul 2026 09:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ezVVq2U50VUNDTO74pfMslMnYi0egB4QQ7ic+2Doqcw=; b=XmxP3Mrd0lfibHS/
	6AA3jEyMX1ipSvtPD2Gh6XvzG5cPAwFp4qnqZZmh91WlNhs2dt4UwDz8bOn3WQjb
	W8cYZIwrYsPjqKlreA9VCKRHCHET7r9wv7Q2bTpwTpTGSuKIO0gctPPPNlk0MHmm
	tmWUxFDDVVfvdT6Pm8mC/kgYtVE3HHi5nTogSE7MIJ+Lpzhp2FWuKIfYCuj3LUzQ
	8fDh7aFnsN9ZHRlFF5kHSpdq4a+gtJS77gPMuUCun3l1IErSDA3mgLG3v1ubFeM4
	uEiWlXaevV7WDefPM7QfRMghA0T8KwEHjDrO2E8dMqBdgRJY0jyHJ2KXNFSxkOFX
	O5ylLQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98h0kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 09:32:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso1245985a12.0
        for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 02:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782984750; x=1783589550; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezVVq2U50VUNDTO74pfMslMnYi0egB4QQ7ic+2Doqcw=;
        b=b2NxoUc5Do2HbuWBLceqmLhiTOq95RwNHKtuR4n0pBjrdqO7Jbpg8XF4IkLio1jGyY
         vUxpOBIVGEr0185jSncZTEVnkM+Tgw+yLGcFrhR3YVoKlHVdpwHWcWL8uQGYm4r8eXw1
         CON0NTAA3f6YZUfu7rGWcw0BFS4Q/JdE52tkjtKXVOOUZervbUaP9J+zO8uX7cjUwa51
         h/oNFryb4eFBjvPYpUjflhy/KHdY0E/11+wY5dYBVzpNKLN0CpQHAhRbEqKjvd+M+n36
         GC7sxZAcb8PA2yEwUSv7OM41QZzonuc/GJsXMBVGswdZH6z+8b5OytpH6RerDNPWV4qt
         mFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984750; x=1783589550;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezVVq2U50VUNDTO74pfMslMnYi0egB4QQ7ic+2Doqcw=;
        b=dQw8tP/Xa8bJE4eJXHuBhT9zIF05FtFWzDiKg5/ztPLpPkNvwEoonDMCkvhRkd+6br
         pi9gOamymuQdjzjV1+YBtUlS4LxBO3KZ7sBXU0tP2m0Kt7QAK4BurvRI3rpQdpFar7fJ
         rUIU/qhAKEsPVLM1oG4pHcf4qJFm7i78ulMXTgVRiDq6HGUYkPWURUfSbJiUVssb1eyE
         VWKSIiTBYm2cTF1EVUmTP6d4Lf1IxxZIWohSad2i4wQWf1ZdbDJzv5EBv6AsK8oZ2DGD
         pqVibeyC7EtY3g15N/R6ANCPcX1nifokJMeZzqd1ZdGm7+CFyxx9j/eHlJ1uG3LhN3v/
         mJlg==
X-Forwarded-Encrypted: i=1; AFNElJ9+RfNdDdyn/GtvC4VKQpVYSXtibr/Kebe3bPcWOJfyFrWsgbOFRzNNhXM0Oq07b9HbFLni3jA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+z6r3/H7v9K+i4xXFJ27NW0FYJUbvX93sg0F8wGek9QtHfNrQ
	C+lGjQGOBmVRtym3XPBeXIAUde8uXwl11+9TT2EO5bKV82ydjkHSCB7Mjzrq1syigjEKw80Ex7V
	cch5k3JUH5dzQR/8cUiRSBhjkGwNKYrum3EZlnvOLUxcdG1PqktOaL4aRI1TiFAGh
X-Gm-Gg: AfdE7cmpGIfP6SIhgWYxRRTZ0L7GXXNQWq9oHJjy/b9UUc9TlCZ44HKRCc86Wn7tHcL
	+UxdnTA1Eg+5cy50oOHUfymvy/4vOXzZy45LW9V1g0AsOBTUpI2fZiIkHYuZ++cw43FmWmEsst8
	J72FWP2X374Fe3X7/ndKfpUAuJZ+aQHxy68wr5Tr+KcRqqk+BTXBkiR2gSLODurVxjjotwvLw2Y
	87UAmnMdUX0G4D5zlUHDAlm5jbVLwiBsUAseRVIeznkcZjWz/6WFoVgoElENtZaMaTQkcorv72x
	GMnx7n9f04cmP/N5vxgJsUvqwJ0AxKXjBz8X+PVROrqUbJwJLNCzSes6lBamvEJ9RzguE7H/2x6
	wWBaE/MnUd9LPt84P7mD3/Tlr0xQhvFLJdlkIIJrBHKIz89Ox4zDZm42Uh92vLmkUYfBYcIhYwj
	35CigswmFF
X-Received: by 2002:a05:6a20:d808:b0:3bf:b228:10ae with SMTP id adf61e73a8af0-3bff402bcd9mr5542812637.5.1782984749519;
        Thu, 02 Jul 2026 02:32:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:d808:b0:3bf:b228:10ae with SMTP id adf61e73a8af0-3bff402bcd9mr5542772637.5.1782984748824;
        Thu, 02 Jul 2026 02:32:28 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e92b81be9sm994089a12.30.2026.07.02.02.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:32:28 -0700 (PDT)
Message-ID: <8024a15f-bbab-47ba-bd18-f85eb1fe3dcd@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 17:32:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
To: Andrew LaMarche <andrewjlamarche@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4D1bYmmW3qBVEybwvej7V_niRmHsHRLz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5NiBTYWx0ZWRfXzdVehGarhWHa
 s2bqfInbXS50akNb2sPojbsh46DXEK4CudAOmVt8WcOTSU07tI11BZrHfIvyHspOY6pXdUEetAD
 EMr+kGDhxYdHY16PWU41R43dOxGeg/ksKT8Jce+4/tWU6tyWfIrQ02zHhMobMhP0ywYZMvaImZm
 K/qKlzyX3ZXsmn1QgCj+PAafpgxB5mevTNaMHIHBzqkRfjvlUeGEOr+m+HUYWgrmpdE5qoa9BAx
 4BGkkh9E5NI22Std6+/G+Yyv79U0mV39GeeDHKq45IptTb0DtGa3fUXnyiYBSlwMgWT/wv997q2
 +wfKUPpVC0E2uACybr9K9Z+77ajvAMFwE322SOjuGnW/MeGoCZQ+dBqS9s84mFiPBBQ+wWIqo7S
 dApSCiNpBJEvSRoeGezccbHSReTrei1apJZ9A909uHl3eR67YiB7JM8NVWKhUD6hZ9jkv1FOif5
 BGJJ5ZpBc21s+3KmaIQ==
X-Proofpoint-GUID: 4D1bYmmW3qBVEybwvej7V_niRmHsHRLz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5NiBTYWx0ZWRfX2TR3dSo425aZ
 f34ov3sLFkmKVmeM4L/zGObXulgPG5shyZkroDY5o5V3FXDEwd8goHDLKPMgdQcfBgSsww1+oGW
 62pi0ngq3L+TUniZf6VWZYBYDfTc+xo=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a46302e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=DTxyy6x_7cgoCtCqgnsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_103236_673344_E72BE08F 
X-CRM114-Status: GOOD (  26.68  )
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



On 6/30/2026 9:30 PM, Andrew LaMarche wrote:
> ath10k and ath11k support reading calibration variants from the device
> tree to locate the correct Board Description File (BDF). The ath12k-wsi
> binding already describes using qcom,calibration-variant but it is not
> implemented in the driver.
> 
> Many ath12k designs expose all the radios under a single phy, each of
> which typically require a separate BDF. Without this, the radios may not
> come up or will not be calibrated correctly.
> 
> Fix this by parsing the device tree for the generation-agnostic
> qcom,calibration-variant. This allows the driver to properly select,
> read and apply the correct BDF.
> 
> Signed-off-by: Andrew LaMarche <andrewjlamarche@gmail.com>
> ---
> Changes in v2:
> - Drop ath12k-specific binding qcom,ath12k-calibration-variant in favor
>   of generation agnostic qcom,calibration-variant.
> - Link to v1: https://lore.kernel.org/all/20260131003222.2011259-1-andrewjlamarche@gmail.com
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 22 ++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/qmi.c  |  4 ++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 742d4fd1b598..52c28864c63c 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -812,6 +812,28 @@ int ath12k_core_check_smbios(struct ath12k_base *ab)
>  	return 0;
>  }
>  
> +int ath12k_core_check_dt(struct ath12k_base *ab)
> +{
> +	size_t max_len = sizeof(ab->qmi.target.bdf_ext);
> +	const char *variant = NULL;
> +	struct device_node *node;
> +
> +	node = ab->dev->of_node;
> +	if (!node)
> +		return -ENOENT;
> +
> +	of_property_read_string(node, "qcom,calibration-variant",
> +			&variant);
> +	if (!variant)
> +		return -ENODATA;
> +
> +	if (strscpy(ab->qmi.target.bdf_ext, variant, max_len) < 0)
> +		ath12k_dbg(ab, ATH12K_DBG_BOOT,
> +				"bdf variant string is longer than the buffer can accommodate (variant: %s)\n", variant);
> +
> +	return 0;
> +}
> +
>  static int ath12k_core_soc_create(struct ath12k_base *ab)
>  {
>  	int ret;
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> index fd762b5d7bb5..3cf39ae06fd3 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> @@ -2945,6 +2945,10 @@ int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
>  	if (r)
>  		ath12k_dbg(ab, ATH12K_DBG_QMI, "SMBIOS bdf variant name not set.\n");
>  
> +	r = ath12k_core_check_dt(ab);

I understand there are already some variant exacting helper (ACPI, SMBIOS) being called
here, but they really should not. After all, how could a qmi message relates to ACPI or
SMBIOS?

I'd like firstly move the existing helpers out and then add the new DT helper.

> +	if (r)> +		ath12k_dbg(ab, ATH12K_DBG_QMI, "DT bdf variant name not set.\n");
> +
>  	r = ath12k_acpi_start(ab);
>  	if (r)
>  		/* ACPI is optional so continue in case of an error */



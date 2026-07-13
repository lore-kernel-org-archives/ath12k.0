Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331D7C44501
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 18:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGm08z2QRTZQR1FZakby7UHoEn+vMY549zyGYn80n3k=; b=hWelO2nTHNwiCfdo1IvTNZO8cn
	qzTEJlCyyTwnchtKXOEFDd1YCIJmKEnq1xiYdjcWXJWyLiY9JzNOoqp6T3UCkw1QegSbMCLB053Al
	lq6clHO09NcJmWj9CptrAZ/Cpk1y0yYt9ud9pOLE6PO2AmBleLjKm0EqTMpPaRV2OZAppTANtixjZ
	7459SHQPYN6r3PMtTDml9ZE5Tnqxiq7U1bagWyKPkhGbiNloa5Vlc1S9FWnli0QyEZohG9KFgUkYF
	VjtZUZ8UWADQrC5NxvNCN/aYiW/KxO6le1GWrcWz8vwp47YcTQ7KHifQIoqOXwT68Z9BAPpUR1XpK
	2dCpefQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjLrY-0000000AFEd-2IWC;
	Mon, 13 Jul 2026 18:58:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjLrV-0000000AFEE-3Ff0
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 18:58:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8Kqt1803535
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 18:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EGm08z2QRTZQR1FZakby7UHoEn+vMY549zyGYn80n3k=; b=WdU4k/7wJY4565Q3
	OBIv/l/9/g9bOCtXtJdW5RUd40bhhXJJtBGCi5XyLAHtadKYz5hVdLU8knWINlps
	bNUIkviKqHLWLxv9gNI9iqXdGJ2UVEa6jsENcnQVNwq4EoYLEz470KHRNeHUHT8o
	sa+g5Qw8UDN99M8RL+ra2kDJC1ovboKK5zPW4s1STq08y2RwX3+UBJFecEuQ8H0O
	9XnFwJm6nPXYLi65NhRQ+zIzTRuprHoYo7OT+5G6P0c+/w8vIfA0qbM/PnP+tnvS
	HmjjtQxXp4vx87eHAWKG9gGELlUiYgWMLYLOoSeiuwkqWt+92FJ1lGBo9st/xAKt
	nCGidg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4t53d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 18:58:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so5308686a12.3
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783969120; x=1784573920; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EGm08z2QRTZQR1FZakby7UHoEn+vMY549zyGYn80n3k=;
        b=D8A2Q1rKTQi+pUgo/VQMQ9y9xs6pffw7gzqiffmTBaOh9Umcnm1JTUxgUAdnTXgD5k
         B/dWq3sleul6nMHl52Cm2MvPCZA+G8HIJ5GZT5OOrroV6ZJeTgEoZ0W+mLfq6d56wH0z
         Oux3nzdTHT+DSvwzrhqbDwGg/zQBz6XLkeY1BmtNXCd3EXZUadL4/ImvFselS4a8exUl
         awaX37rhkaSlPwtMERJaxD1m3Shcdk8DF8Nv6OkSW09cWgAcUJkdf+My/w+Pn+o0jlSP
         XYuDzo5xa7P+k6kKeacChGSbsJZQ7Hy5JzoXhl9gK8lxtuaf7/2rAjF2c/ejrncJTK0g
         g4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783969120; x=1784573920;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EGm08z2QRTZQR1FZakby7UHoEn+vMY549zyGYn80n3k=;
        b=AJVBCE1NbxFMVxZe3YCniY8PjWBcCki2htyiC5slMpcmYHN6hecPTV5O7zVAADTv8M
         2gO42lto4SON/k6V6HoTVo3YiOe3SasbVV2sHErhQGG/pofxqd55G3UA1CSwAwO2g2E8
         8HpeqNAi//1WW+mtF4I4xw/swhy2Jq1LEmM5Ecdivkbl6/sPQtF2SutFAzWEbox9mBl2
         +kY+qL2Id2wyaGsI1+ZEqZ6WZBV01KKNWnvQKWoURpqJowEa62gf06ID7lPCprXThgC8
         XRl+G9jM2YASH2IlNqJg2h7c9D8JLV59aGNnDNPc50EYGqzTucyGBCOrdMsvy/zAZpgv
         rbaw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8WSNaY6ULtmy/JdhgDbN9SsvWCjthW6zdBeP1Vihys7rmRzBvknU0uR9PoeH5k8GP0UR84Hs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj5odvhNM4mmc45LJG8mYiexUHNdlVep7SxnvnRmhT0lZ2oXo0
	b/R4RR1hNRXj+64lvAa1mVjY/zNKs4TaLZn3TIGT2KCh+OhIW+DiDWjYt53siqWtGHCstWzNp80
	0Ds3j7XNmyOUeUqftTYkfLv8e8x9+NLnF22omhtocp66Rk/zDqxJMQkxYpYyF+uVK/aY48IzAEB
	0=
X-Gm-Gg: AfdE7clb21jPrEOamTwRKO4dqmZDsfRcqqlRPV7tcMpbQ7iU3mInQharHsq+tuSQkNi
	JVYEOJfX2n8eHbpq1EEVrDlaDb2yiLM5MzKRagBLVdWhF0njQ0Wg11qjpKBgg2uG3D6q4mIabBf
	1ipGV5BAB26aORj2m3bgIjYfR+uiy1i0MxYtVK+cWXACqw+l9rw+mXTMue74ZCxNCZ4MKTpPJPU
	0g3EKyiduX2EeXxKsdFQiy8czKPIfbT9iRpCBsXPjrvlR96/18uOkPZ1kbFSJ7OZL2+7eVSwfqr
	N7REG2S565h6+Ul79IUb19DgWsD1P2trTA2yG7++eSjYEGjVn2vjaU/oQiIk45vjMyd8d5omk9u
	EMaQ2NWY1il/cjV/HQPVlyqkP9UUh7rb3LtFHhFeS1yZbgCLjTiMFHucycBbr9CHrzf2S
X-Received: by 2002:a05:6a20:b7a7:b0:3bf:63af:859 with SMTP id adf61e73a8af0-3c110ad2e6amr11568610637.45.1783969119584;
        Mon, 13 Jul 2026 11:58:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:b7a7:b0:3bf:63af:859 with SMTP id adf61e73a8af0-3c110ad2e6amr11568594637.45.1783969119131;
        Mon, 13 Jul 2026 11:58:39 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6091dsm83117734eec.14.2026.07.13.11.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 11:58:38 -0700 (PDT)
Message-ID: <09e17504-d1b3-4e3a-b547-3c3c1040015c@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:58:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/14] wifi: ath12k: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
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
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-13-sumit.garg@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260702115835.167602-13-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a553560 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=CBpSC656wZACrugyqBAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE5NyBTYWx0ZWRfXwg0tm6yUKikA
 u/fuWCp9CiPWaJp9qK15bZKKctAQw087zf6nS7F13/26Me0Yzc3Ca3ppiGDP9fjxj2GRbSU2RlL
 HzQi1QawnWOwsPEqYlxnRCBFef/hhsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE5NyBTYWx0ZWRfX9M0dFrk8KfpE
 pLjqRhK2WENdRcUf6b2Mc56EuV9wHCmPR6nfFsk9dzoZx2IPN+nHyiBVVXUJdsiPK6VF1K0vTbU
 McSCsYRwqIy2wZ6+l3+pIt0OPAciKsXvs/2i7cgNrdtqjB6rGfNUk/9GROh6e8iZkm/qvJmoeEA
 fYqmEMh61iuziz8TntcEDbFAxz4UQSffbge1LkqlHoo7B1vVxxo4E1LD2dX2CHRXtmr3SxRy1hH
 U0JJ+v3QZQeuoCtsyZa9aRBAP8eWBoZYDlwYAuhEqxryfSyqj0k+WCujV8CH0FAAaDPGsbhBS0l
 omZnBKLa2xXTxXGWlO1cX4QYZ/9zfHpMvXx37Znqru0P9SuC0+0QurrIgGvAovcRWQxB73NzXSp
 42obI+8BQPf9p2f9bMElBa5kTAe+SLMsS6K57whkbCNEfxfc2STxoKZPl6u0l7YuvQN3GDn0VC5
 eiW7DtMu4x9/Yb2VGhQ==
X-Proofpoint-ORIG-GUID: uSCBlpjEQY2ZAD7wL0vu5XmrHwAocMlt
X-Proofpoint-GUID: uSCBlpjEQY2ZAD7wL0vu5XmrHwAocMlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_115841_999217_7CCE90D2 
X-CRM114-Status: GOOD (  20.60  )
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

On 7/2/2026 4:58 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ath12k client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Acked-by: Jeff Johnson <jjohnson@kernel.org>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
>  drivers/net/wireless/ath/ath12k/ahb.c   | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
> index 4a2b240f967a..0d5d1c55bfc1 100644
> --- a/drivers/net/wireless/ath/ath12k/Kconfig
> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> @@ -18,7 +18,7 @@ config ATH12K_AHB
>  	bool "Qualcomm ath12k AHB support"
>  	depends on ATH12K && REMOTEPROC
>  	select QCOM_MDT_LOADER
> -	select QCOM_SCM
> +	select QCOM_PAS
>  	help
>  	  Enable support for Ath12k AHB bus chipsets, example IPQ5332.
>  
> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
> index 30733a244454..69e21214e629 100644
> --- a/drivers/net/wireless/ath/ath12k/ahb.c
> +++ b/drivers/net/wireless/ath/ath12k/ahb.c
> @@ -5,7 +5,7 @@
>   */
>  
>  #include <linux/dma-mapping.h>
> -#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -420,7 +420,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
>  
>  	if (ab_ahb->scm_auth_enabled) {
>  		/* Authenticate FW image using peripheral ID */
> -		ret = qcom_scm_pas_auth_and_reset(pasid);
> +		ret = qcom_pas_auth_and_reset(pasid);
>  		if (ret) {
>  			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
>  			goto err_fw2;
> @@ -485,10 +485,10 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
>  		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
>  			 ATH12K_AHB_UPD_SWID;
>  		/* Release the firmware */
> -		ret = qcom_scm_pas_shutdown(pasid);
> +		ret = qcom_pas_shutdown(pasid);
>  		if (ret)
> -			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
> -				   ab_ahb->userpd_id);
> +			ath12k_err(ab, "PAS shutdown failed for userPD%d: %d\n",
> +				   ab_ahb->userpd_id, ret);
>  	}
>  }
>  

My code review agent is flagging:

**Missing probe-defer guard** (`ahb.c:422`) — `qcom_pas_is_available()` is
explicitly documented as mandatory before any PAS call. The OP-TEE backend
registers its ops asynchronously; without an `if (!qcom_pas_is_available())
return -EPROBE_DEFER` in the probe path, firmware auth silently returns
`-ENODEV` with no retry.

Is it an existing deficiency in ath12k that there is no probe deferral?
Or did the qcom_scm_*() calls somehow guarantee something that is no longer
true with the qcom_pas_*() calls?

And also for future cleanup:
**Misleading field name** (`ahb.c:384`) — `scm_auth_enabled` should be
`pas_auth_enabled` to match the backend-agnostic API it now guards.

I plan on taking this patch as-is through the ath tree since it is currently
just simple API changes. Any additional changes can come separately.

/jeff




Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31C1E7717F
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 14:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVeDpFHKaFlPDGxPLRlIP4tfmUhxa0lLWG/6rA+mE3A=; b=IkICrZnLESbMMq188Ol7IHv+3A
	dnPdKopyZH3Kb3O2OEa9NxVWNjjFuSM7+N+7HXWrNJI2uWcxWcF761QKy3uMjJQLJ4AZHiv/eNWqp
	EKLiRU4cCXqd/3dMi37+rMUCObdLXKX1XiR+Fpa2WwilRfeJmrko1OzyqyfcG19QVMjdXiV6soKVK
	EGN56bxchkY4miDU5S4xBn3ZZuDLIFWhn23CCBijBxjkCFE6hKwPS2E7DhVIILfISyu8AfI5L7lgd
	zFqjNqvT9cuajN9M8QeaBVNbDRtCYu60sKKrHfom61toWy06PRzLgT4ohtPELhuuvr5kM4xlPH3KP
	8D8OuV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1dv-0000000Bruy-23Y5
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 14:55:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1bO-0000000BrLO-0KS3
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 14:52:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C4F2A41906;
	Tue, 10 Dec 2024 14:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380ECC4CED6;
	Tue, 10 Dec 2024 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733842360;
	bh=T8bfjPlMu3bOeVNznQxKg8Q5VGqihqrLN21VgNgbq9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j6l/8maGvxdZZRrkaMVV/zyhkr9OMKDuAGjoE2eqMLfJHJ6OdP//G2ZyAjej81Aid
	 6YrTWgBvsXeW8B1ZCTenoL4FS4BxCaZAfXKDBQeSHTB693H3RcH+SmL+2H2fDLAKp/
	 QhKl2vgB9Bwu+j3bCFEZPhXfrlY9wNsLyEhrYmirYXDR1mkgl01PM8f8dQO61uV3u/
	 NXSxZGXzsw+TCNuBUDvaKBjpAFGpVgzw4yEdLjB+WRDWKpO8zWZ69IT5wHU1lr6z6x
	 Dg3uFv6f3kdnrUsw1kcowOHA90plNnYkMKmEsENPCcQJGQIOXy0Nqt2Gd6t5m4o6Ug
	 XXUKnL89+mwmA==
Message-ID: <bd3f7586-4119-47f5-bbf6-a43bd02088b8@kernel.org>
Date: Tue, 10 Dec 2024 15:52:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] wifi: ath12k: Power up userPD
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
References: <20241210074159.2637933-1-quic_rajkbhag@quicinc.com>
 <20241210074159.2637933-12-quic_rajkbhag@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241210074159.2637933-12-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_065242_253786_090B829E 
X-CRM114-Status: GOOD (  13.61  )
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

On 10/12/2024 08:41, Raj Kumar Bhagat wrote:
> +
> +	time_left = wait_for_completion_timeout(&ab_ahb->userpd_ready,
> +						ATH12K_USERPD_READY_TIMEOUT);
> +	if (!time_left) {
> +		ath12k_err(ab, "UserPD ready wait timed out\n");
> +		ret = -ETIMEDOUT;
> +		goto err_fw2;
> +	}
> +
> +	qcom_smem_state_update_bits(ab_ahb->spawn_state, BIT(ab_ahb->spawn_bit), 0);
> +
> +	ath12k_info(ab, "UserPD%d is now UP\n", ab_ahb->userpd_id);

Don't bug users with success messages. Your driver is supposed to be
silent on success.

> +
> +err_fw2:
> +	release_firmware(fw2);
> +err_fw:
> +	release_firmware(fw);
> +	return ret;
> +}
> +
>  static void ath12k_ahb_init_qmi_ce_config(struct ath12k_base *ab)
>  {
>  	struct ath12k_qmi_ce_cfg *cfg = &ab->qmi.ce_cfg;
> @@ -557,6 +694,7 @@ static const struct ath12k_hif_ops ath12k_ahb_hif_ops_ipq5332 = {
>  	.irq_enable = ath12k_ahb_ext_irq_enable,
>  	.irq_disable = ath12k_ahb_ext_irq_disable,
>  	.map_service_to_pipe = ath12k_ahb_map_service_to_pipe,
> +	.power_up = ath12k_ahb_power_up,
>  };
>  
>  static irqreturn_t ath12k_userpd_irq_handler(int irq, void *data)
> diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
> index 0999e2bbe970..0dbbbfd45eab 100644
> --- a/drivers/net/wireless/ath/ath12k/ahb.h
> +++ b/drivers/net/wireless/ath/ath12k/ahb.h
> @@ -19,7 +19,15 @@
>  #define ATH12K_PCI_IRQ_CE0_OFFSET		3
>  #define ATH12K_ROOTPD_READY_TIMEOUT		(5 * HZ)
>  #define ATH12K_RPROC_AFTER_POWERUP		QCOM_SSR_AFTER_POWERUP
> -

Why? You just added this line in previous commits.

> +#define ATH12K_AHB_FW_PREFIX			"q6_fw"
> +#define ATH12K_AHB_FW_SUFFIX			".mdt"
Best regards,
Krzysztof


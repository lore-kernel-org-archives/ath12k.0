Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601C9E7717F
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 21:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZysTPSoi0Hzg+PqL0sYQkTEeXKGqp8qMg3H7sj4hg4=; b=PWgX1ZTw1FBf4Q7JdIPiRJho1z
	dbRDb/HFYJ9ki6XYkThDTgXObdpWK1pzXTRQCWRLen8llo5T4pqbt10uce66fGc9cYvoEeCDOrD9D
	zuwpzP20e49VtUcc2YjB3KjgtdyNETZ3sHXx0c9pD4x28OIX+WuiIJaUXWvY7hNI7u3SlgpjolvXU
	OgfBE/G6rxgYic4KDAVHC/zjfph8Q0eDCqO8E5WNcwFI/6IrKKJvwYjFmIpbYMnQZpGZyiFp7UhY6
	AxJ04mxcaiSP4BqkeSQ3IBvFfbYHGTt7CxXcTYHgEqVo+pj7FQhsqLvTjTBvLl4vZHmncFGAk4sgs
	k7k/TA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Lq-0000000CkUA-0bTK
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 21:01:02 +0000
Received: from bout3.ijzerbout.nl ([2a01:7c8:fff8:2b8:5054:ff:fe86:f72d])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Jq-0000000CjvG-31zG
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 20:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1733864319; bh=v2raCaWN3IG/5w/aOn1R+icWgs90NdTA6z+LvPlbe1o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OArvQjGJNCmsOR94itS7QtZxcp/cZbSiLL9l9fSA0rrBt/8AXT1jSbc4cR2z8/tmu
	 1OzHqoh/vyDUAvJO7k1U6X5GXLog723yXC4mTWoDS0MOcv3AQfM9k2Sx3jjwloZ71z
	 BJnUzK6U9fS7nmNLBOvNl79OkdEsMlcJsg8qscN6mXFA0cxSmoNYNm62Fr2pC8KJhA
	 DaPqaqh8iks88o7wNFLMB2egi+bjH/NNJ7XPCv01GBJk7F7+OlW5dXWJWb9UZ/ypPn
	 38GOlhRVE6h2BXvmB1t0vkE0dhZinC6zfiX6RILZsYfInwKQSBZT0dJYqbVTeIO0Sl
	 4uCGz0UmVaKh4K5GmsKgJaXrheMibsSf3lW/X0rykBE/T+WAG37xLZHRLoeRAmUgo6
	 jXpbjwPiRNXtNQSLfaWfT4o2kGb1miFj/K//+StV37fC504TFutA/7srb4uuBm6HNt
	 4uoWH6xj++V6Ww60iAdApQ4NP/juEavaqXe1irj7DMakfHS/heWNjb0fKIXcFYfqAt
	 s4fnyzQH3M4+0dqeUYgPqWvPm3OUEa3BWNYkFP+LDd/69lx8qM8mowTL6tuCZoRyGx
	 260VYLC+EvbzBe6PWSshjA8r4jWtxnRE5P5IyjVbkq2ok59tp00cENA332NYBu6Ao8
	 vgn92l7uTueQ93G4xp4pM3ow=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 1D46118E519;
	Tue, 10 Dec 2024 21:58:34 +0100 (CET)
Message-ID: <bfd41680-060f-4bd8-a289-f4ef69429c30@ijzerbout.nl>
Date: Tue, 10 Dec 2024 21:58:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] wifi: ath12k: move struct ath12k_hw from per device
 to group
To: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 Harshitha Prem <quic_hprem@quicinc.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
References: <20241204163216.433795-1-kvalo@kernel.org>
 <20241204163216.433795-6-kvalo@kernel.org>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20241204163216.433795-6-kvalo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_125859_188855_130C1058 
X-CRM114-Status: GOOD (  14.26  )
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

Op 04-12-2024 om 17:32 schreef Kalle Valo:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>
> Currently, hardware abstractions (ah) of different radio bands are tightly
> coupled to a single device (ab). But, with hardware device group abstraction
> (ag), multiple radios across different devices in a group can form different
> combinations of hardware abstractions (ah) within the group. Hence, the mapping
> between ah to ab can be removed and instead it can be mapped with struct
> ath12k_hw_group (ag).
> [...]
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> [...]
> -void ath12k_mac_destroy(struct ath12k_base *ab)
> +void ath12k_mac_destroy(struct ath12k_hw_group *ag)
>   {
>   	struct ath12k_pdev *pdev;
> +	struct ath12k_base *ab = ag->ab[0];
> +	int i, j;
>   	struct ath12k_hw *ah;
> -	int i;
>   
> -	for (i = 0; i < ab->num_radios; i++) {
> -		pdev = &ab->pdevs[i];
> -		if (!pdev->ar)
> +	for (i = 0; i < ag->num_devices; i++) {
> +		ab = ag->ab[i];
> +		if (!ab)
>   			continue;
>   
> -		pdev->ar = NULL;
> +		for (j = 0; j < ab->num_radios; j++) {
> +			pdev = &ab->pdevs[j];
> +			if (!pdev->ar)
> +				continue;
> +			pdev->ar = NULL;
> +		}
>   	}
>   
>   	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
> @@ -10942,26 +10945,59 @@ void ath12k_mac_destroy(struct ath12k_base *ab)
>   	}
>   }
>   
The new ath12k_mac_destroy() looks suspicious with respect to "ab".
Here is the new function with comments.

void ath12k_mac_destroy(struct ath12k_hw_group *ag)
{
         struct ath12k_pdev *pdev;
         struct ath12k_base *ab = ag->ab[0];
==> here ag->ab[0] is used before checking if ag->num_devices is greater 
than zero
==> If ag->num_devices will never be zero then this first assignment 
will be repeated in the next for-loop
==> if ag->num_devices can be zero then you need to confirm that 
ag->ab[0] is non-NULL

         int i, j;
         struct ath12k_hw *ah;

         for (i = 0; i < ag->num_devices; i++) {
                 ab = ag->ab[i];
                 if (!ab)
=>> This if check indicates that ab can be NULL
                         continue;

                 for (j = 0; j < ab->num_radios; j++) {
                         pdev = &ab->pdevs[j];
                         if (!pdev->ar)
                                 continue;
                         pdev->ar = NULL;
                 }
         }

==> Now ab is going to be used, but as shown above, ab can be NULL
         for (i = 0; i < ath12k_get_num_hw(ab); i++) {
                 ah = ath12k_ab_to_ah(ab, i);
                 if (!ah)
                         continue;

                 ath12k_mac_hw_destroy(ah);
                 ath12k_ab_set_ah(ab, i, NULL);
         }
}

-- 
Kees


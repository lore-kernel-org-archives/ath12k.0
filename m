Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF41C4332F
	for <ath12k@archiver.kernel.org>; Tue,  8 Nov 2022 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9zGWcca0cSSZlBGePgDSxvpQD+Cc49h2m7iA9cqXj5c=; b=WwwOMmx7194lZ6
	p44kyJBUPCRstn7wngNtYs4e+IVJc1yuRUs5kbvMs89u+lyLWp9RcZIRgIzi6qk4KmNe2rFNUKXl9
	/N2CB1usyZBfjQUeKv7hCXypTB+aI3Jn2fbs9ggTE0XxJB8M4/BRScp9GiGfKJnBUUVhM+9fZlJFb
	IKs5QPQNVuH3xfbFHq37HnYL3Nees2nr7WrZq/zRGLYa80JcIpkmBz6+aaBGTM+SPIXOsYEWzPUv6
	baS0EYfzeeg8wa+aWTYiANQaVn11/yGdkFe11uPPLktiANmOwIyStXxNF/U+TY4uCFjNUSsPXUmJy
	NsxXf+lvvQvbOHQi70sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQlH-006ScO-H3
	for ath12k@archiver.kernel.org; Tue, 08 Nov 2022 15:43:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQlE-006SbX-Us
	for ath12k@lists.infradead.org; Tue, 08 Nov 2022 15:43:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 832FD615F0;
	Tue,  8 Nov 2022 15:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21077C433D6;
	Tue,  8 Nov 2022 15:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667922213;
	bh=lf76joayZHy975MeL79OQav4d1JzUMNm/feIr0Fw8K8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pTNwuTkNEyRjWxqmKl5jQ7Mj/DFAAoFKbyLMVV71m/zmG0iBjliCbYvwenVvhcBOX
	 o5yEa9Zucic1J9+X2nMiX/NbW+4qvEXNtd4knBsg1u+vatuTal4Cxu4GojH1K4FT2l
	 FOwddKo1Zlonk3HmdNyQLvo+g294BU74+Ah4eH7g4pGTdmF59vqqSbsxzs4r163XFn
	 aYfbz0oT8Bp5DD6VRgoqb41dCfLy/xhAxFQFqOLd+aeX7zC84cB5yWSbDAwBNv9oya
	 kXLw3LSV5Ct7dVLFuLjLsmCvmjUXynFXQ7N6dsiu+Z0Hz4ft+M+fNMbBsOJwt1WkLf
	 4PN1haYYhzj1A==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 47/50] wifi: ath12k: add wmi.h
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-48-kvalo@kernel.org>
	<5460619d-38e3-9960-5bc7-63854bd01b46@quicinc.com>
Date: Tue, 08 Nov 2022 17:43:27 +0200
In-Reply-To: <5460619d-38e3-9960-5bc7-63854bd01b46@quicinc.com> (Jeff
	Johnson's message of "Thu, 18 Aug 2022 18:11:52 -0700")
Message-ID: <87h6z9cuzk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_074337_093769_3109DE05 
X-CRM114-Status: GOOD (  15.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 8/12/2022 9:10 AM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> (Patches split into one patch per file for easier review, but the final
>> commit will be one big patch. See the cover letter for more info.)
>>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/wmi.h | 4796 +++++++++++++++++++++++++++++++++
>>   1 file changed, 4796 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h
>> b/drivers/net/wireless/ath/ath12k/wmi.h
> [...]
>> +/* defines to set Packet extension values whic can be 0 us, 8 usec or 16 usec */
>
> s/whic/which/

Fixed.

>> +enum {
>
> naming the enum allows you to reference the enum in code and comments
>
>> +	WMI_HOST_WLAN_2G_CAP	= 0x1,
>> +	WMI_HOST_WLAN_5G_CAP	= 0x2,
>> +	WMI_HOST_WLAN_2G_5G_CAP	= 0x3,
>> +};

Renamed to enum WMI_HOST_WLAN_BAND.

>> +#define WMI_CMD_UNSUPPORTED 0
>
> why not just add this to enum wmi_tlv_cmd_id?

Added.

>> +#define WMI_PEER_MIMO_PS_STATE                          0x1
>> +#define WMI_PEER_AMPDU                                  0x2
>> +#define WMI_PEER_AUTHORIZE                              0x3
>> +#define WMI_PEER_CHWIDTH                                0x4
>> +#define WMI_PEER_NSS                                    0x5
>> +#define WMI_PEER_USE_4ADDR                              0x6
>> +#define WMI_PEER_MEMBERSHIP                             0x7
>> +#define WMI_PEER_USERPOS                                0x8
>> +#define WMI_PEER_CRIT_PROTO_HINT_ENABLED                0x9
>> +#define WMI_PEER_TX_FAIL_CNT_THR                        0xA
>> +#define WMI_PEER_SET_HW_RETRY_CTS2S                     0xB
>> +#define WMI_PEER_IBSS_ATIM_WINDOW_LENGTH                0xC
>> +#define WMI_PEER_PHYMODE                                0xD
>> +#define WMI_PEER_USE_FIXED_PWR                          0xE
>> +#define WMI_PEER_PARAM_FIXED_RATE                       0xF
>> +#define WMI_PEER_SET_MU_WHITELIST                       0x10
>> +#define WMI_PEER_SET_MAX_TX_RATE                        0x11
>> +#define WMI_PEER_SET_MIN_TX_RATE                        0x12
>> +#define WMI_PEER_SET_DEFAULT_ROUTING                    0x13
>
> perhaps create an enum for these?

Added enum wmi_peer_param.

>> +#define WMI_VDEV_SLOT_TIME_LONG         0x1
>> +#define WMI_VDEV_SLOT_TIME_SHORT        0x2
>
> another enum?

enum wmi_slot_time

>> +#define WMI_VDEV_PREAMBLE_LONG          0x1
>> +#define WMI_VDEV_PREAMBLE_SHORT         0x2
>
> another enum?

enum wmi_preamble

>> +/* Regaulatory Rule Flags Passed by FW */
>
> s/Regaulatory/Regulatory/

Fixed.

>> +#define WMI_KEY_PAIRWISE 0x00
>> +#define WMI_KEY_GROUP    0x01
>
> create an enum?

enum wmi_key_type

>> +#define WMI_CIPHER_NONE     0x0 /* clear key */
>> +#define WMI_CIPHER_WEP      0x1
>> +#define WMI_CIPHER_TKIP     0x2
>> +#define WMI_CIPHER_AES_OCB  0x3
>> +#define WMI_CIPHER_AES_CCM  0x4
>> +#define WMI_CIPHER_WAPI     0x5
>> +#define WMI_CIPHER_CKIP     0x6
>> +#define WMI_CIPHER_AES_CMAC 0x7
>> +#define WMI_CIPHER_ANY      0x8
>> +#define WMI_CIPHER_AES_GCM  0x9
>> +#define WMI_CIPHER_AES_GMAC 0xa
>
> create an enum?

enum wmi_cipher_type

Jeff, thank you so much for all the review comments. Very much
appreciated!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

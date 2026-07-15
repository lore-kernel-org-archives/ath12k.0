Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45870C44501
	for <ath12k@archiver.kernel.org>; Wed, 15 Jul 2026 12:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYn30NuQBlpDBaqikH9GRFE2pdu5APUaoZom7kBIJ94=; b=GtH8tfMnQ7eMNhvVZxofKCNATy
	eU37A9nJTWgAR0gzRJ+JYN3j9ziLihsk/1IpJbHl1y2YlLjFVgRznZM+Kq71oh/qGYj49qNXJcz+W
	H+oTDq62tygBtUvgoqAIcYQa97o0cHHaPi5QKZZAE65Iq+HcO8vJcUcy/1pkzilr8Gh133C33eAEE
	9uICxUT1hwb/eYVaeWRr7+ND1GvC+ZVs/+Ha3GXGuHTus2bSAdbVWOWMKxxP6ko1+L5Y7qAscohKM
	0W28+50BYUg61xE0uX5nPx0i2EE9mR6AroZTE4TgDNuD1q9JTO1veeBDi0H8/N6ZwGlrt6M4mcf5O
	8RAcV/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyXL-0000000Ekbn-48oy;
	Wed, 15 Jul 2026 12:16:27 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyXC-0000000EkSK-0NVp
	for ath12k@lists.infradead.org;
	Wed, 15 Jul 2026 12:16:26 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-8ff20870ac7so39953686d6.1
        for <ath12k@lists.infradead.org>; Wed, 15 Jul 2026 05:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1784117773; x=1784722573; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYn30NuQBlpDBaqikH9GRFE2pdu5APUaoZom7kBIJ94=;
        b=Rbg4kdYoREVhyuo/hRu3RcoOxcvQ53Tan4qhLqBFVUUBcpH1Gp2RD6Ajlfn3fjvtes
         IhBiSbrV0oT0vztlGvHfT3Lg6/+J+Zoo9u6aU3ohizfMcN/lwAsq7nAKiCGH8dGyo96/
         npecXi6ulfEXTlcWG7bM4lWCxIAVhZSrZ4BSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117773; x=1784722573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYn30NuQBlpDBaqikH9GRFE2pdu5APUaoZom7kBIJ94=;
        b=GilpEV0DnnoWSHN0rjYRsukh5dEJ1OqHuWD8xBx+aIwD4BCXQD4aul07a1wjF4VpVy
         QBkuv8I7k5/8gZgbxr8nFp9K2ceOf25Ku1Phmv0e1tZ8eW2Ci8K76V7M34WGH7K9LoCV
         Oa0IEnzivn8CXYuOTcLJym63/Zc/8H6/YAL75zl3UgTAR76vJBVHI2viHlb9VGZYgcQY
         OMB2lvXoGVD2Sx6mqpPnZ7Kgei+8q5qSE6GEBOrigAowDD5LyQBak3ogJ+9FOFGQA0pU
         qKu7OoMrpsIQnjPTKoCctBCdSWwObYfQahatVKQbL5vaGb/1VcditcEaVPfF/SIeRcCI
         vYEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1X8RdmOAdFesHGfUsenyHeV4Pm5kYnRJnUDUzCJl+6FXAFL2uWc4hQe55DdrGqctan1my8kY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9RT921n/GttwPDWmWZ2sO9++ByaEXouLUuTAYwHgfC066lueY
	JM3uGvxUYVBKji9YJIFdBQ6T8GlQ1iC4qfdIv5ZwebQZ+M2G1F0FtzWYX4t4nQiVnQ==
X-Gm-Gg: AfdE7ckPvDV+TYufr5jkQ2HCzDMrSquRzPxisN1XH/lpFNK1kd1mg104ZOn68dTNLMA
	IG71pYDrha6ojT727F6oLT68PZS9/IlAyEJRYV6Ut10SuIGtnoVOESHsFngsavV4b4au/oV8yzd
	TUzTvLVEqtob93YfhPgIOzf2H9O51n9XbLOSSGoYPkUXFehzp5+QUONNdaeEXlPEMqQcQUKUIVr
	Oc7mD4fkuZE7HyaftxKIyz8LHCcmijeBmJ5XiXCOHYyrVaYXB0F0LzcHnDVPTvIQ5fJ4ibGINjw
	GrhZ2zrVRKhc2l9e1AVSTV3OiLZOOqj8fKnxuvqF55/czou48SzajN8DtmZa5P3u5c9gkknsdHP
	VtHtcCWmoQbqUVyIfYiUj/TqNDbovoPNsCygJ6gVDmSFogUSvdMHzJj7nwUyP3zCOQvUcd49HP0
	9MMBQfkuYAyIxhf3BqLq29
X-Received: by 2002:a05:6214:500e:b0:8ef:5b18:65ec with SMTP id 6a1803df08f44-9074c70b5cemr66890686d6.15.1784117772692;
        Wed, 15 Jul 2026 05:16:12 -0700 (PDT)
Received: from [10.211.55.5] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-8ffd7c1fd2bsm193918296d6.27.2026.07.15.05.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:16:11 -0700 (PDT)
Message-ID: <358b1215-df7a-427f-89cc-55a6f2cf357c@ieee.org>
Date: Wed, 15 Jul 2026 07:16:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/14] net: ipa: Switch to generic PAS TZ APIs
To: Bjorn Andersson <andersson@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, sean@poorly.run, akhilpo@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
 elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 jjohnson@kernel.org, mathieu.poirier@linaro.org,
 trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
 pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
 tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
 srinivas.kandagatla@oss.qualcomm.com, amirreza.zarrabi@oss.qualcomm.com,
 jenswi@kernel.org, op-tee@lists.trustedfirmware.org,
 apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
 linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Alex Elder <elder@riscstar.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-12-sumit.garg@kernel.org> <alJp8jMzcw9EPZoy@baldur>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <alJp8jMzcw9EPZoy@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_051618_279999_75FAF549 
X-CRM114-Status: GOOD (  21.00  )
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

On 7/11/26 11:06 AM, Bjorn Andersson wrote:
> On Thu, Jul 02, 2026 at 05:28:27PM +0530, Sumit Garg wrote:
>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>
>> Switch ipa client driver over to generic PAS TZ APIs. Generic PAS TZ
>> service allows to support multiple TZ implementation backends like QTEE
>> based SCM PAS service, OP-TEE based PAS service and any further future TZ
>> backend service.
>>
> 
> Please find an immutable branch with the dependencies for this patch at:
>    https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260702115835.167602-2-sumit.garg@kernel.org
> 
> Alternatively, if you think there will be no conflicting patches in the
> time leading up to next merge window provide an Ack and I can pick this
> through the qcom tree.

I don't see any reason there would be any conflicts (certainly
no difficult conflicts) with this commit, so I think you can
safely take it with the others through the Qualcomm tree.

So if my ack is what you're looking for:

Acked-by: Alex Elder <elder@riscstar.com>

Thank you Sumit and Bjorn.

> 
> Thanks,
> Bjorn
> 
>> Reviewed-by: Alex Elder <elder@riscstar.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> ---
>>   drivers/net/ipa/Kconfig    |  2 +-
>>   drivers/net/ipa/ipa_main.c | 13 ++++++++-----
>>   2 files changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
>> index 01d219d3760c..a9aff1b7977d 100644
>> --- a/drivers/net/ipa/Kconfig
>> +++ b/drivers/net/ipa/Kconfig
>> @@ -6,7 +6,7 @@ config QCOM_IPA
>>   	depends on QCOM_RPROC_COMMON || (QCOM_RPROC_COMMON=n && COMPILE_TEST)
>>   	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
>>   	select QCOM_MDT_LOADER
>> -	select QCOM_SCM
>> +	select QCOM_PAS
>>   	select QCOM_QMI_HELPERS
>>   	help
>>   	  Choose Y or M here to include support for the Qualcomm
>> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
>> index 788dd99af2a4..3cd9e44680e9 100644
>> --- a/drivers/net/ipa/ipa_main.c
>> +++ b/drivers/net/ipa/ipa_main.c
>> @@ -14,7 +14,7 @@
>>   #include <linux/pm_runtime.h>
>>   #include <linux/types.h>
>>   
>> -#include <linux/firmware/qcom/qcom_scm.h>
>> +#include <linux/firmware/qcom/qcom_pas.h>
>>   #include <linux/soc/qcom/mdt_loader.h>
>>   
>>   #include "ipa.h"
>> @@ -624,10 +624,13 @@ static int ipa_firmware_load(struct device *dev)
>>   	}
>>   
>>   	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
>> -	if (ret)
>> +	if (ret) {
>>   		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
>> -	else if ((ret = qcom_scm_pas_auth_and_reset(IPA_PAS_ID)))
>> -		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
>> +	} else {
>> +		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
>> +		if (ret)
>> +			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
>> +	}
>>   
>>   	memunmap(virt);
>>   out_release_firmware:
>> @@ -758,7 +761,7 @@ static enum ipa_firmware_loader ipa_firmware_loader(struct device *dev)
>>   		return IPA_LOADER_INVALID;
>>   out_self:
>>   	/* We need Trust Zone to load firmware; make sure it's available */
>> -	if (qcom_scm_is_available())
>> +	if (qcom_pas_is_available())
>>   		return IPA_LOADER_SELF;
>>   
>>   	return IPA_LOADER_DEFER;
>> -- 
>> 2.53.0
>>



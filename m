Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57A4C4167B
	for <ath12k@archiver.kernel.org>; Thu, 30 Nov 2023 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBDM3hyjnVgp/8KP+9rph7M12mYa2HO4p0BEM3zkrWM=; b=X9mhTmC5d8i8pZjdhTT/RTwWTg
	7yQJ+m8NGP9BAgWLtzm1IC4bSY6vu2I2SOATF6DozF5NIEEATOoXyhDK/MPsX/DhNxvqg3MVFi09M
	zDRTJfa4HhxCeUIGx8kukqf0pSVKg0K/aibR6e3Xsv/RUTUn+951zOYIWsJBZkbOrOaD3eruoAqSj
	R6sSDKsTdlRKLCyrlpe7BoGJ4tSRtWBeuHNfw8EDLhhuMTRJdq30ntDkgX/54D6fCT723l97iaUGy
	cMNlmH2z+H/a/NPPiNTzMVYl+qpSJnTfnUDkQp5yj9ljQmKKDD4m+DspQ3DAYYqGNQQoao1PpH50m
	IuZKNs5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8jkU-00BJ1D-1b
	for ath12k@archiver.kernel.org;
	Thu, 30 Nov 2023 16:18:46 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8jkO-00BIyn-28
	for ath12k@lists.infradead.org;
	Thu, 30 Nov 2023 16:18:45 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 6FCB3C006F;
	Thu, 30 Nov 2023 16:18:31 +0000 (UTC)
Received: from [192.168.100.159] (50-251-239-81-static.hfc.comcastbusiness.net [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id F2C2413C2B0;
	Thu, 30 Nov 2023 08:18:30 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com F2C2413C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1701361111;
	bh=vPAJCejKVMHhPr3XHKHFJsrYCczHJ33qkumGmoldPwc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=aMIEncJoxs5myPYUUmJrYQB9vSL+Qtvs/0AgGWr/6+zA5m/o6O+N76pErgKnPdu3W
	 i0Z2CpgfgOfhrooRinI1xXtxmoj2sTNfSEbe+RlvCSai9tCq0joFwX9A4VuB7eQg3l
	 E6Alh4yPa0Zb+jEe6I0pcd0k1CqTUh4tlQiZombo=
Message-ID: <b48f1931-7844-9dd9-7668-0e553385afdf@candelatech.com>
Date: Thu, 30 Nov 2023 08:18:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Firmware for qcn9274?
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org
References: <864419c3-71e1-49e8-40e1-88bfafba26f4@candelatech.com>
 <bcc2a41e-0d5c-46b2-acbc-fa0f22c55232@quicinc.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <bcc2a41e-0d5c-46b2-acbc-fa0f22c55232@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1701361112-7asJkI_dg_6w
X-MDID-O: us5;ut7;1701361112;7asJkI_dg_6w;<greearb@candelatech.com>;6f229667a7254cdc88e13b408b211c59
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_081840_718093_1653865B 
X-CRM114-Status: GOOD (  10.90  )
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

On 11/29/23 14:49, Jeff Johnson wrote:
> On 11/29/2023 9:39 AM, Ben Greear wrote:
>> Hello,
>>
>> Where are the ath12k firmware binaries located?  I don't see any ath12k tree
>> in linux-firmware, for instance.
>>
>> ]# dmesg|grep ath12
>> [   55.381104] ath12k_pci 0000:0e:00.0: BAR 0: assigned [mem 0xdf000000-0xdf1fffff 64bit]
>> [   55.415662] ath12k_pci 0000:0e:00.0: Hardware name: qcn9274 hw2.0
>> [   55.592167] mhi mhi0: Direct firmware load for ath12k/QCN9274/hw2.0/amss.bin failed with error -2
>>
>> Thanks,
>> Ben
>>
> See if this helps
> https://wireless.wiki.kernel.org/en/users/drivers/ath12k/installation
> 

It got me closer, but the ath11k-firmware directory tree has different path than what the driver expects.

[greearb@v-f34-64 firmware]$ find . -name amss.bin -print
./ath12k/QCN9274/hw2.0/WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1/amss.bin
./ath12k/QCN9274/hw2.0/WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1/amss.bin
./ath12k/WCN7850/hw2.0/WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4/amss.bin
./ath11k/QCA6390/hw2.0/amss.bin
./ath11k/WCN6855/hw2.0/amss.bin
./ath11k/QCN9074/hw1.0/amss.bin


Which one of those QCAHKSWPL directories I use?

I'm using 6.7-rc2+ kernel.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com




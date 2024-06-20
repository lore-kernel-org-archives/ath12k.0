Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E86FC2BA18
	for <ath12k@archiver.kernel.org>; Thu, 20 Jun 2024 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/8F6EwNwQcG3yU/Kbwf8OIaW1KdmtgE0Iw3cobe324=; b=19JyDiDY5M0U3YWai2zQh/EBGS
	7qFYycxm6UV7d/4Yhmw3T1AAxlgt8KOUk2em3LU5dvuaoC9l3EfBkiB/5k7ZYoI2MzDuVUBqVdbgS
	o/ke7sIF/14Xlbt1GgryUP49LXbOZMpG3c0s8GzlMg6iIGzKdLRueAxpVri3/eXSYBwC5HilEdDHB
	5ewt7pubBteC3Qg2z21x1JkVwriBjeXQP/1tubeuCuoqxRLEjzo7N0SJu0O4N150iThUX6IrF+swm
	aGucGRsdoECpUkCQ8PsNS6cLy31JX1kZfCf4xUOLJpxXms5yzGc94dm5j9szbVV2efclUeJxNiEQV
	4Ef0L4oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIoS-00000005SlR-0Xyo
	for ath12k@archiver.kernel.org;
	Thu, 20 Jun 2024 14:30:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIoO-00000005Sjw-2BnF;
	Thu, 20 Jun 2024 14:30:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 366CD621CD;
	Thu, 20 Jun 2024 14:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E671C4AF0B;
	Thu, 20 Jun 2024 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718893850;
	bh=lFnvmyEqgdYMJeF8dWD9Fuq9BZ+u9+Ev069om7FPMpQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AutipYDt61pdZCchXMSoqgfIdvPa6FKNlhIbdWjsyMmefRUobYSzMDwsaDlyod2kv
	 sCAqR265rGA6cmHjiRX/iqw4Iqk36RSjWfZ+3ySyVatuPBKp2M1wRPmwzFf9XLTH9E
	 GoDQGMn/l7y4tHjhFyNij9Esy2NciNDerQmXvuJphkNx9mAlyMqlJcLFNj2qgKPy7E
	 FRFInMLlYQDRf8ye/ThTL3pQ8O3zaPnYVU22bzjphx0K2SuSbdId/iapNsodUAx523
	 +K3J38wVFzunMlN5qEtbaf17DADoKcPKWbXk0aRxVztFFunpGHuyDmDb1WhazTy3I/
	 4QAhhUTNKrDaA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67D0FC39563;
	Thu, 20 Jun 2024 14:30:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 00/17] power: sequencing: implement the subsystem and
 add first users
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <171889385042.4585.381673079448841277.git-patchwork-notify@kernel.org>
Date: Thu, 20 Jun 2024 14:30:50 +0000
References: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
In-Reply-To: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcel@holtmann.org,
 luiz.dentz@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, quic_bgodavar@quicinc.com,
 quic_rjliao@quicinc.com, kvalo@kernel.org, jjohnson@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, bhelgaas@google.com,
 srinivas.kandagatla@linaro.org, quic_eberman@quicinc.com,
 caleb.connolly@linaro.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@linaro.org, elder@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 quic_jjohnson@quicinc.com, ath12k@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 bartosz.golaszewski@linaro.org, kernel@quicinc.com,
 krzysztof.kozlowski@linaro.org, amit.pundir@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_073052_706864_65C37048 
X-CRM114-Status: GOOD (  14.83  )
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

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 28 May 2024 21:03:08 +0200 you wrote:
> Note: I am resending this series in its entirety once more for
> discussions and reviews. If there won't be any major objections, I'll
> then start sending individual bits and pieces to appropriate trees.
> 
> Merging strategy: The DT binding and DTS changes are a no-brainer, they
> can go through the wireless, regulator and arm-msm trees separately. The
> bluetooth and PCI changes have a build-time dependency on the power
> sequencing code. The bluetooth changes also have a run-time dependency on
> the PCI pwrctl part. In order to get it into next I plan to pick up the
> power sequencing code into my own tree and maintain it. I can then
> provide an immutable tag for the BT and PCI trees to pull. I wouldn't
> stress about the BT runtime dependency as it will be fixed once all
> changes are in next.
> 
> [...]

Here is the summary with links:
  - [v8,01/17] regulator: dt-bindings: describe the PMU module of the QCA6390 package
    (no matching commit)
  - [v8,02/17] regulator: dt-bindings: describe the PMU module of the WCN7850 package
    (no matching commit)
  - [v8,03/17] dt-bindings: net: bluetooth: qualcomm: describe regulators for QCA6390
    https://git.kernel.org/bluetooth/bluetooth-next/c/251180e6dba5
  - [v8,04/17] dt-bindings: net: wireless: qcom,ath11k: describe the ath11k on QCA6390
    (no matching commit)
  - [v8,05/17] dt-bindings: net: wireless: describe the ath12k PCI module
    (no matching commit)
  - [v8,06/17] arm64: dts: qcom: sm8550-qrd: add the Wifi node
    (no matching commit)
  - [v8,07/17] arm64: dts: qcom: sm8650-qrd: add the Wifi node
    (no matching commit)
  - [v8,08/17] arm64: dts: qcom: sm8650-hdk: add the Wifi node
    (no matching commit)
  - [v8,09/17] arm64: dts: qcom: qrb5165-rb5: add the Wifi node
    (no matching commit)
  - [v8,10/17] power: sequencing: implement the pwrseq core
    (no matching commit)
  - [v8,11/17] power: pwrseq: add a driver for the PMU module on the QCom WCN chipsets
    (no matching commit)
  - [v8,12/17] PCI: hold the rescan mutex when scanning for the first time
    (no matching commit)
  - [v8,13/17] PCI/pwrctl: reuse the OF node for power controlled devices
    (no matching commit)
  - [v8,14/17] PCI/pwrctl: create platform devices for child OF nodes of the port node
    (no matching commit)
  - [v8,15/17] PCI/pwrctl: add PCI power control core code
    (no matching commit)
  - [v8,16/17] PCI/pwrctl: add a PCI power control driver for power sequenced devices
    (no matching commit)
  - [v8,17/17] Bluetooth: qca: use the power sequencer for QCA6390
    https://git.kernel.org/bluetooth/bluetooth-next/c/4029dba6b6f1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




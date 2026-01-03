Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58306FC6160
	for <ath12k@archiver.kernel.org>; Sat,  3 Jan 2026 17:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bFyUdFNV3dmTFiGjIJAr4fPo6iqmjuXdMood/ABM14=; b=deA2cuBbesKA3RPCcx0fzVameE
	cPQr2cv3AtXbhE4k6O0B6o+XS7TkX0edSasKrsLaVInTjSE7mMQkti/4dXcOUMoI6QN/pkggu1hIV
	p/NW4N7HVFieNJOeJ/+HJDkgzT1OxghgOmNF2NvPQLfLqaJ21ss1dkaUgH/aaSoeRtvOTGuX4AboG
	yZIPd/JmofqYcYAIxGgmlUEYNp1x1ezduyqy8XVfwO/nE4yPKW5zWItXcLL2Ldd0Xe3Yre6XFirEG
	dFGYHHVwd8/mmL+v68ELSrmf6urkE1DLSFtxxsfVWvUPKjpDoOO+fTf50oLYzuMcaSf0pfDIIeVED
	UNEHjagA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc5n9-00000009gDr-1W2a;
	Sat, 03 Jan 2026 17:51:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc5n8-00000009gDl-0UVR
	for ath12k@lists.infradead.org;
	Sat, 03 Jan 2026 17:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2437F60126;
	Sat,  3 Jan 2026 17:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A750C19422;
	Sat,  3 Jan 2026 17:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767462712;
	bh=/5CTIoZ+dEyqw60A6EXzdsbPpn/68FO19Wzg2NxH9QQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t/ACO9KsbmBhvRBFKM2gAplnSXeVw77IpN5C4+0c4/rm1kIrneRsxJU7sXqm2tdWE
	 jKL1yFKJgEBviUA0jDQmyQXS/k8A3wHvzStWW2TOSIGyY/i66U0dDVwmh83cULHdi8
	 qY7cePy6Nq32UZoDFK4KoudShCxA1VEIG5sLKImkff26nSN+w6G9iL16QTain5HkBo
	 rSjNumFRAN5FKdVmS4BiTMNxx/0b4dkG15G3Yx5/V5wY4LPhngsBSRWTJondAKBgaE
	 k3GYVOwBcxplRiBCXUgRwSC14J9cX6ky/TixfexnZGJ4bNT93ISmHKV6asZcNr7TG5
	 yECp6jGTK63wQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Dale Whinham <daleyo@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 0/4] Microsoft Surface Pro 11 support
Date: Sat,  3 Jan 2026 11:51:43 -0600
Message-ID: <176746270364.2648843.15525156382034430633.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251220-surface-sp11-for-next-v6-0-81f7451edb77@gmail.com>
References: <20251220-surface-sp11-for-next-v6-0-81f7451edb77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Sat, 20 Dec 2025 16:26:28 +0100, Jérôme de Bretagne wrote:
> This series brings support for the Qualcomm-based Microsoft Surface
> Pro 11 covering both the OLED and LCD variants.
> 
> 

Applied, thanks!

[2/4] firmware: qcom: scm: allow QSEECOM on Surface Pro 11
      commit: 380f8a4c734b029100dea5bc9e2f8982f72da6b9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


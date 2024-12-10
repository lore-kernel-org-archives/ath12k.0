Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA263E7717F
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 08:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZEpGHmUaj3B1U4MLnA0R8+x3boJiyaZKUnQAlIRvu/Q=; b=VDuWwWGKiXKnLx/vRPb3FbqTWd
	C1WWgP32bqYfLJz4omxwEC89fcMbxbWyUVnpGduG0Tsukwxd7sHZaq8Zpiid5tYoXLFagef3jtdjY
	aGSpZWb2JzUuqFJsL51750uBjTXlNClTSUOMd9p/OLPAPA+hh3wIwIZbw09hPhRI7IRsqxQL5P7HS
	lxt3lXPJ2qTAWFgoM/cMEzeAcY5OJ26vk9OxdmdgMIQtyxw7mgU4Xe7iFBgiXLf6JTB2Wt4b/KXJ0
	S0ynRfWPj/QdXtqfKkseMQ4of7DNLu9StcczN5J2AVOltMCLWh4GWh0qKKzB+Is8SioM7OKbu5eB0
	0drRNkOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvmq-0000000Ak6E-1ux7
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 08:40:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvi6-0000000AjGG-1JlX
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 08:35:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-385e0e224cbso2683698f8f.2
        for <ath12k@lists.infradead.org>; Tue, 10 Dec 2024 00:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733819712; x=1734424512; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEpGHmUaj3B1U4MLnA0R8+x3boJiyaZKUnQAlIRvu/Q=;
        b=SB+b0dKn0z6cJIwYZ7RJZKtHii2/qNbbJZayT+wDDS3ItA96rQpyBQYJByJsGgYrxX
         /SLZknbFwz6PLVFWNrYwAZIKe+gm2MPXkjZ1fHyX42IBHShZxFEbSBvAVu4U3bc0WudK
         ZIgcatdZc74AMRr+/GI/km7Z9hWhOIvFINSEos4Fm1SioemE6isHfluBohk/IaPEXq0r
         nqGZ5E0WkNr8QrVkyL0yyY2OOWX6cj/P2vPksZt/dQGm6NIkSWI7K2HB1VndPlyD0rXx
         XCmYOJm8oDgD3kC9Ug7mzUjfNw5eiG6u6NHMYaGk8sojFPas+8IUJYLZK1h/jzJWSDel
         ZGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733819712; x=1734424512;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEpGHmUaj3B1U4MLnA0R8+x3boJiyaZKUnQAlIRvu/Q=;
        b=l6GHfmdGC7Um0AUC36fwavZcr40SQyPe3NIvW363oMUbrts9txlCumXyztwmHuXLL8
         kOkdhRHHF4Vqx/9l9HpLi0J0fKa1DrVJu0pxcVXlwyFcbL3is1SwF909mXJ6x3RLYtVd
         gz/9KXSEwM5gIQr37JIeCGv0VWNu+LgHMneKDMYL/1CkruRcfVkT29uCmIXUCe1lSObF
         IYO3qF6VFey6LoqJvMLjfPrSYagtQd4tUX+KvKan1KvHJN0sxt+nFLtj1k4F5G0P0XJK
         CVKmD9vi2LuHX4vptde9OHMctOOvgyCQLQ/V+wprZ5myv34PxlrY8KFOAQL+I/76oVzk
         cAZA==
X-Gm-Message-State: AOJu0Yzhvg+FrHP4pxMuhuPE9pv+cXr/v9KbXOfJnkg0n5104NlLgIzR
	tqHhTK+U2jR6Ulm8sqslDvDlShaLykL8FtVUVpTNBzUab2prF0/3ZBX4UW3itmE=
X-Gm-Gg: ASbGncsKeiJ72034KE3fC/zfWHq1pCZeGXCmgZ2Xcg93GDzI7w3+sc/KxwTfSnjG8GZ
	rkCz0QLSPwHMsGCstLp1wtKYuAPeZNrejZx/TIXJje8Mom8IcG2gSdzN49LyEqVtzAQkBnNltII
	JAF+8oGbP1CZMVlHb6pW8duolUaHUuAQ6o0XoeyRF3fVI2wCYf6vldP0icamuYGaq2Jxqv450vC
	fLddpgF2I6gjejoKgrk0tlbv/IKUSiWlMGtDTzhJQft/MSdy47tFsknUMo=
X-Google-Smtp-Source: AGHT+IHcgrcloo47sbTAKqhbqLsK9jVHrxKywheL1w30j7p74JwE5gm6WRMWwN+PQqReQ4QKDSDskw==
X-Received: by 2002:a05:6000:4409:b0:385:eb8b:3ec6 with SMTP id ffacd0b85a97d-386453e2830mr1717898f8f.29.1733819711864;
        Tue, 10 Dec 2024 00:35:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386408549b9sm4751106f8f.89.2024.12.10.00.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 00:35:11 -0800 (PST)
Date: Tue, 10 Dec 2024 11:34:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: move struct ath12k_hw from per device to
 group
Message-ID: <3e705de0-67d1-4437-97ff-4828d83ae2af@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_003514_351583_A143716B 
X-CRM114-Status: UNSURE (   7.05  )
X-CRM114-Notice: Please train this message.
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

Hello Karthikeyan Periyasamy,

Commit a343d97f27f5 ("wifi: ath12k: move struct ath12k_hw from per
device to group") from Dec 4, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/net/wireless/ath/ath12k/mac.c:10938 ath12k_mac_destroy()
	error: we previously assumed 'ab' could be null (see line 10927)

drivers/net/wireless/ath/ath12k/mac.c
    10918 void ath12k_mac_destroy(struct ath12k_hw_group *ag)
    10919 {
    10920         struct ath12k_pdev *pdev;
    10921         struct ath12k_base *ab = ag->ab[0];
    10922         int i, j;
    10923         struct ath12k_hw *ah;
    10924 
    10925         for (i = 0; i < ag->num_devices; i++) {
    10926                 ab = ag->ab[i];
    10927                 if (!ab)
                              ^^^
The patch addes this check for NULL.  What about if it's the last element
which is NULL?

    10928                         continue;
    10929 
    10930                 for (j = 0; j < ab->num_radios; j++) {
    10931                         pdev = &ab->pdevs[j];
    10932                         if (!pdev->ar)
    10933                                 continue;
    10934                         pdev->ar = NULL;
    10935                 }
    10936         }
    10937 
--> 10938         for (i = 0; i < ath12k_get_num_hw(ab); i++) {
                                                    ^^
If so, then it leads to a crash here.

    10939                 ah = ath12k_ab_to_ah(ab, i);
    10940                 if (!ah)
    10941                         continue;
    10942 
    10943                 ath12k_mac_hw_destroy(ah);
    10944                 ath12k_ab_set_ah(ab, i, NULL);
    10945         }
    10946 }

regards,
dan carpenter

